//
//  ObjetivosForaNivelSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização da Section dos Objetivos fora do nível do Estudante.
struct ObjetivosForaNivelSectionView: View {
    
    // MARK: - Body da View
    var body: some View {
        Section {
            ObjetivosForaNivelView()
        } header: {
            Text("Titulo.Objetivos.Fora.Nivel".localized())
                .textCase(.uppercase)
                .font(.system(size: 14))
        }
    }
}
