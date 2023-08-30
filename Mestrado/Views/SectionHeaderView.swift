//
//  SectionHeaderView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

struct SectionHeaderDTO {
    /// Título do Header de um Section de uma View.
    var titulo: String
    /// Quantidade de Objetivos de Aprendizado ou Reflexões que um Estudante possuí em uma Disciplina.
    var quantidade: Int
}

struct SectionHeaderView: View {
    // MARK: - Variáveis e Constantes
    
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pelo DTO do Header de uma Section.
    var dto: SectionHeaderDTO
    
    /// Binding que permite informar se uma section precisa ser expandida ou não.
    @Binding var sectionExpandida: Bool
    
    // MARK: - Body da View
    var body: some View {
        HStack {
            Text(dto.titulo)
                .textCase(.none)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.texto2)
            
            Spacer()
            
            Image(systemName: sectionExpandida && dto.quantidade > 0 ? "chevron.down" : "chevron.forward")
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
