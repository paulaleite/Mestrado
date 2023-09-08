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
    @State var selecao: Bool = true
    
    // MARK: - Body da View
    var body: some View {
        Section {
            EstudantesDisciplinaCellView()
                .listRowBackground(Color.fundo2)
        } header: {
            SectionTituloObrigatorioView(titulo: "Titulo.Estudante.Plural".localized())
        }
        
        if !viewModel.estudantes.isEmpty {
            Section {
                ForEach(viewModel.estudantes, id: \.self) { estudante in
                    EstudantesDisciplinaCellListView(nome: estudante.nome, numDeIdentificacao: estudante.numIdentificacao, selecao: $selecao)
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
    /// Nome do Estudante
    var nome: String
    /// Número de Identificação do Estudante
    var numDeIdentificacao: Int
    
    /// Binding que representa a seleção e deseleação do Estudante na Disciplina.
    @Binding var selecao: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $selecao) {
                VStack {
                    Text(nome)
                        .foregroundColor(Color.texto1)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("Titulo.Numero.Identificacao".localized()).foregroundColor(Color.texto2)
                            .font(.system(size: 11))
                            .fontWeight(.bold)
                        
                        Text("\(numDeIdentificacao)")
                            .foregroundColor(Color.texto2)
                            .font(.system(size: 11))
                            .fontWeight(.regular)
                        
                        Spacer()
                    }
                }
                .padding(.vertical, 4)
            }
            .toggleStyle(CheckboxToggleStyle(corSelecionada: Color.gray, corDeselecionada: .secondary))
        }
    }
}

/// Visualização da célula de solicitação da adição de Estudantes, levando a uma lista de Estudantes.
struct EstudantesDisciplinaCellView: View {
    // MARK: - Body da View
    var body: some View {
        NavigationLink {
            EmptyView()
        } label: {
            Text("Descricao.Estudante.Adicionar".localized())
                .foregroundColor(Color.texto1)
                .font(.body)
        }
    }
}
