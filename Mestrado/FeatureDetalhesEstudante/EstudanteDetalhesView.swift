//
//  EstudanteDetalhesView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização mais extensa do Estudante, que o Professor utiliza.
struct EstudanteDetalhesView: View {
    // MARK: - Variáveis e Constantes
    @StateObject var viewModel: EstudanteDetalhesViewModel = EstudanteDetalhesViewModel()
    
    /// Identificador único do Estudnate.
    var estudante: EstudanteFiltroModel
    /// Identificador único da Disciplina
    var disciplinaID: String
    
    /// Estado que informa qual momento avaliativo está selecionado.
    @State var momentoAvaliativoSelecionado: String = "Titulo.Momentos.Todos".localized()
    
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
        List {
            ObjetivosForaNivelSectionView()
            ObjetivosNaoAvaliadosSectionView()
            AutoavaliacaoCompletaSectionView(dto: FiltroMomentosDTO(titulos: self.momentos), momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
        }
        .onAppear {
            Task {
                await viewModel.getDadosDetalhesEstudante(estudanteID: estudante.id, disciplinaID: disciplinaID)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.fundo1)
        .environmentObject(viewModel)
        .navigationTitle(estudante.nome)
        .navigationBarTitleDisplayMode(.inline)
    }
}
