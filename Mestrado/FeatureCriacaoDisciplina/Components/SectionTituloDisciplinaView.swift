//
//  SectionTituloDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Visualização da Section do título da Disciplina.
struct SectionTituloDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    /// Binding que contém a String do título da disciplina.
    @Binding var tituloDisciplina: String
    
    // MARK: - Body da View
    var body: some View {
        Section {
            TextField("Titulo".localized(), text: $tituloDisciplina, axis: .vertical)
                .listRowBackground(Color.fundo2)
        } header: {
            SectionTituloObrigatorioView(titulo: "Titulo.Titulo.Disciplina".localized())
        }

    }
}
