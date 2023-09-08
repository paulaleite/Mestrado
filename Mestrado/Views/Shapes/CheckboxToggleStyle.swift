//
//  CheckboxToggleStyle.swift
//  Mestrado
//
//  Created by Paula Leite on 08/09/23.
//

import SwiftUI

/// Estilo de Toggle específico, que representa um checkbox, da mesma forma que é construído para Macbook.
struct CheckboxToggleStyle: ToggleStyle {
    // MARK: - Variáveis e Constantes
    /// Cor de fundo quando selecionada
    var corSelecionada: Color
    
    /// Cor de fundo quando deselecionada
    var corDeselecionada: Color
    
    // MARK: - Funções
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(configuration.isOn ? corSelecionada : corDeselecionada)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}
