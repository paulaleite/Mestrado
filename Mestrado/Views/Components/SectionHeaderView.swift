//
//  SectionHeaderView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

struct SectionHeaderView: View {
    // MARK: - Variáveis e Constantes
    
    /// Título do Header de um Section de uma View.
    var titulo: String
    
    var quantidade: Int
    
    /// Binding que permite informar se uma section precisa ser expandida ou não.
    @Binding var sectionExpandida: Bool
    
    // MARK: - Body da View
    var body: some View {
        HStack {
            Text(titulo)
                .textCase(.none)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.texto2)
            
            Spacer()
            
            Image(systemName: sectionExpandida && quantidade > 0 ? "chevron.down" : "chevron.forward")
                .fontWeight(.semibold)
                .foregroundColor(Color.texto2)
                .frame(width: 20, height: 20)
        }
        .onTapGesture {
            withAnimation {
                sectionExpandida.toggle()
            }
        }
    }
}
