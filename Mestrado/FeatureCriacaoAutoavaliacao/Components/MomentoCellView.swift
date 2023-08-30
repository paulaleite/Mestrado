//
//  MomentoCellView.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import SwiftUI

/// Com essa visualização, é possível selecionar o Momento Avaliativo da Autoavaliação.
struct MomentoCellView: View {
    
    // MARK: - Variáveis e Constantes
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    // MARK: - Body da View
    var body: some View {
        HStack {
            Text("Titulo.Momento.Plural".localized())
                .foregroundColor(Color.texto1)
            
            Spacer()
            
            Text(momentoAvaliativoSelecionado)
                .foregroundColor(Color.texto2)
        }
    }
}
