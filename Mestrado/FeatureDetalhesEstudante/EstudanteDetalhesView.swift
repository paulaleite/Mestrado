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
    @StateObject var viewModel: EstudanteDetalhesViewModel = EstudanteDetalhesviewMode()
    
    var estudanteID: String
    
    // MARK: - Body da View
    var body: some View {
        List {
            Section {
                Text("Hello")
            } header: {
                Text("Hello")
            }

        }
    }
}
