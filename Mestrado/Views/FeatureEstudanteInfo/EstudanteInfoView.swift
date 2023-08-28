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
    
    @ObservedObject var viewModel: EstudanteInfoViewModel = EstudanteInfoViewModel()
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = "Titulo.Momentos.Todos".localized()
    
    /// Variável computável que configura adiciona no começo da lista de momentos avaliativos, a opção de filtro com todos os objetivos.
    var momentos: [String] {
        var resultado: [String] = []
        for momentoAvaliativo in viewModel.momentosAvaliativos {
            resultado.append(momentoAvaliativo.titulo)
        }
        resultado.insert("Titulo.Momentos.Todos".localized(), at: 0)
        return resultado
    }
    
    // MARK: - Inicializadores
    
    init(estudanteID: String, disciplinaID: String) {
        viewModel.estudanteID = estudanteID
        viewModel.disciplinaID = disciplinaID
    }
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            List {
                Section {
                    GraficoBarrasEstudanteInfoView(viewModel: viewModel)
                        .padding(.bottom, 16)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.fundo2)
                } header: {
                    Text("Competências".localized())
                        .font(.title.bold())
                        .foregroundColor(Color.texto1)
                        .textCase(.none)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .listRowSeparator(.hidden)
                        .padding(.horizontal, -20)
                }
                
                AutoavaliacaoEstudanteInfoTituloView(dto: FiltroMomentosDTO(titulos: self.momentos), viewModel: viewModel, momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.fundo1)
                    .padding(.horizontal, -20)
                
                AutoavaliacaoEstudanteInfoView(viewModel: viewModel, momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                    .listRowBackground(Color.fundo2)
            }
            .listStyle(.insetGrouped)
            .frame(maxHeight: .infinity)
            .navigationTitle("Disciplina 1")
        }
        .background(Color.fundo1)
    }
}
