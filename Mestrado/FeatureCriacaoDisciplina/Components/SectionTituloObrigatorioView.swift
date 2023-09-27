//
//  SectionTituloObrigatorioView.swift
//  Mestrado
//
//  Created by Paula Leite on 08/09/23.
//

import SwiftUI

/// Título de Seções, no caso em que é necessário adicionar as informações dela.
struct SectionTituloObrigatorioView: View {
    // MARK: - Variáveis e Constantes
    /// Título da Seção a ser criada.
    var titulo: String
    
    // MARK: - Body da View
    var body: some View {
        HStack(spacing: 2) {
            Text("*")
                .foregroundColor(.red)
                .font(.system(size: 12))
                .fontWeight(.bold)
            
            Text(titulo)
                .textCase(.uppercase)
                .font(.system(size: 12))
                .foregroundColor(Color.texto2)
            
            Spacer()
        }
    }
}
