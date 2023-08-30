//
//  EstudanteInfosView.swift
//  Mestrado
//
//  Created by Paula Leite on 25/08/23.
//

import SwiftUI

/// Com essa visualização, o Estudante consegue encontrar todas as Informações referentes à Disciplina selecionada. Sendo um gráfico que representa a quantidade de objetivos de aprendizados concluídos em cada competência e os resultados de todas as suas autoavaliações.
struct EstudanteInfoView: View {
    // MARK: - Constantes e Variáveis
    
    @StateObject var viewModel: EstudanteInfoViewModel = EstudanteInfoViewModel()
    
    var estudanteID: String
    var disciplinaID: String
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = "Titulo.Momentos.Todos".localized()
    /// Estado que informa se a solicitação ocorreu de forma incorreta.
    @State var mostrarErro: Bool = false
    
    /// Variável computável que configura adiciona no começo da lista de momentos avaliativos, a opção de filtro com todos os objetivos.
    var momentos: [String] {
        var resultado: [String] = []
        for momentoAvaliativo in viewModel.momentosAvaliativos {
            resultado.append(momentoAvaliativo.titulo)
        }
        resultado.insert("Titulo.Momentos.Todos".localized(), at: 0)
        return resultado
    }
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            if viewModel.estaBuscando {
                LoadingView()
            } else {
                List {
                    Section {
                        GraficoBarrasEstudanteInfoView(viewModel: viewModel)
                            .padding(.bottom, 16)
                            .listRowSeparator(.hidden)
                    } header: {
                        Text("Titulo.Competencia".localized())
                            .font(.title.bold())
                            .foregroundColor(Color.texto1)
                            .textCase(.none)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.fundo1)
                            .padding(.horizontal, -20)
                    }
                    
                    AutoavaliacaoEstudanteInfoTituloView(dto: FiltroMomentosDTO(titulos: self.momentos), viewModel: viewModel, momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.fundo1)
                        .padding(.horizontal, -20)
                    
                    AutoavaliacaoEstudanteInfoView(viewModel: viewModel, momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                        .background(Color.fundo1)
                }
                .listStyle(.insetGrouped)
                .frame(maxHeight: .infinity)
                .navigationTitle("Disciplina 1")
                .background(Color.fundo1)
            }
        }
        .scrollContentBackground(.hidden)
        .onAppear {
            Task {
                await viewModel.getDadosInfoEstudante(estudanteID: estudanteID, disciplinaID: disciplinaID)
            }
            if viewModel.mensagemDeErro != nil {
                mostrarErro.toggle()
            }
        }
        .alert(isPresented: $mostrarErro) {
            Alert(title: Text(viewModel.mensagemDeErro!), message: Text("Alert.Mensagem.Erro".localized()), dismissButton:
                    .cancel(Text("Titulo.OK".localized())))
        }
    }
}
