//
//  ObjetivosTodosSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização da Section dos Objetivos não avaliados Estudante.
struct AutoavaliacaoCompletaSectionView: View {
    var body: some View {
        Section {
            ObjetivosNaoAvaliadosView()
        } header: {
            Text("Titulo.Objetivos.Nao.Avaliados".localized())
                .textCase(.uppercase)
                .font(.system(size: 14))
        }
    }
}
