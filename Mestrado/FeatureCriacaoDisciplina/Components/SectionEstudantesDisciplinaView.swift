//
//  SectionEstudantesDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Visualização dos Estudantes que foram adicionados na Disciplina.
struct SectionEstudantesDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Estado que representa a seleção e deseleação do Estudante na Disciplina.
//    @State var selecao: Bool = true
    
    @State var abrirSheet: Bool = false
    
    // MARK: - Body da View
    var body: some View {
        Section {
            Button {
                abrirSheet = true
            } label: {
                HStack {
                    Text("Descricao.Estudante.Adicionar".localized())
                        .foregroundColor(Color.texto1)
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.texto2)
                        
                }
            }
            .listRowBackground(Color.fundo2)
                
        } header: {
            SectionTituloObrigatorioView(titulo: "Titulo.Estudante.Plural".localized())
        }
        .sheet(isPresented: $abrirSheet) {
            EstudantesEscolhaView()
                .interactiveDismissDisabled(true)
        }
        
        if !viewModel.estudantes.isEmpty {
            Section {
                ForEach(viewModel.estudantes, id: \.self) { estudante in
                    EstudantesDisciplinaCellListView(estudante: estudante, selecao: true)
                        .listRowBackground(Color.fundo2)
                }
                
            } header: {
                SectionTituloObrigatorioView(titulo: "Titulo.Estudante.Adicionado".localized())
            }
        }
        
    }
}

/// Visualização da célula da lista de estudantes adicionados à disciplina.
struct EstudantesDisciplinaCellListView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Informações do Estudante.
    var estudante: EstudanteGetPostDisciplinaModel
    
    /// Binding que representa a seleção e deseleação do Estudante na Disciplina.
    @State var selecao: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $selecao) {
                VStack {
                    Text(estudante.nome)
                        .foregroundColor(Color.texto1)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("Titulo.Numero.Identificacao".localized()).foregroundColor(Color.texto2)
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                        
                        Text("\(estudante.numIdentificacao)")
                            .foregroundColor(Color.texto2)
                            .font(.system(size: 11))
                            .fontWeight(.regular)
                        
                        Spacer()
                    }
                }
                .padding(.vertical, 4)
            }
            .toggleStyle(CheckboxToggleStyle(corSelecionada: Color.gray, corDeselecionada: .secondary))
            .onChange(of: selecao, perform: { newValue in
                if newValue {
                    viewModel.criarEstudante(estudante: estudante)
                } else {
                    viewModel.removerEstudante(estudante: estudante)
                }
            })
        }
    }
}

/// Visualização que possui a lista com todos os estudantes disponíveis.
struct EstudantesEscolhaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    @Environment(\.dismiss) var dismiss

    /// Texto da busca que vai ser atualizado sempre que o usuário mudá-lo.
    @State var textoBusca: String = ""
    /// Estado que permite aparecer o Alert de Cancelamento.
    @State var mostrarConfirmacao = false
    
    /// Resultado da busca por um texto específico.
    var resultadoBusca: [EstudanteGetPostDisciplinaModel] {
        if textoBusca.isEmpty {
            return viewModel.estudantesDisponiveis
        } else {
            return viewModel.estudantesDisponiveis.filter {
                $0.nome.contains(textoBusca) || $0.numIdentificacao.description.contains(textoBusca)
            }
        }
    }
    
//    @State var selecao: Bool
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            List {
                ForEach(resultadoBusca, id: \.self) { estudante in
                    EstudantesDisciplinaCellListView(estudante: estudante, selecao: preState(estudante: estudante))
                }
            }
            .searchable(text: $textoBusca)
            .scrollContentBackground(.hidden)
            .background(Color.fundo1)
            .navigationTitle("Descricao.Estudante.Adicionar".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        mostrarConfirmacao.toggle()
                    } label: {
                        Text("Titulo.Concluido".localized())
                            .foregroundColor(Color.corDeAcao)
                    }
                    .alert(isPresented: $mostrarConfirmacao) {
                        Alert(title: Text("Alert.Titulo.Estudantes.Adicionar".localized()), message: Text("Alert.Mensagem.Objetivos.Adicionar".localized()), primaryButton: .cancel(Text("Titulo.Editar".localized())), secondaryButton: .default(Text("Titulo.Salvar".localized())) {
                            dismiss()
                        })
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getDadosCriacaoDisciplina()
            }
        }
    }
    
    func preState(estudante: EstudanteGetPostDisciplinaModel) -> Bool {
        if !viewModel.estudantes.isEmpty {
            if viewModel.estudantes.contains(where: { $0.id == estudante.id }) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
