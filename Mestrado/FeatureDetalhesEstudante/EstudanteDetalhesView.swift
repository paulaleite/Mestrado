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
    
    // MARK: - Body da View
    var body: some View {
        List {
            ObjetivosForaNivelSectionView()
        }
        .onAppear {
            Task {
                await viewModel.getDadosDetalhesEstudante(estudanteID: estudante.id, disciplinaID: disciplinaID)
            }
        }
        .environmentObject(viewModel)
        .navigationTitle(estudante.nome)
        .navigationBarTitleDisplayMode(.inline)
    }
}
