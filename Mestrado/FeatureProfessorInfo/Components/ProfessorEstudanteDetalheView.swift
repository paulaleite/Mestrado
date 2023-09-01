//
//  ProfessorEstudanteDetalheView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização dos detalhes do estudante que o professor necessita ter acesso.
struct ProfessorEstudanteDetalheView: View {
    // MARK: - Variáveis e Constantes
    var qtd: String
    var titulo: String
    
    var body: some View {
        HStack(spacing: 2) {
            Text(qtd)
                .font(.system(size: 11))
                .fontWeight(.bold)
                .foregroundColor(Color.texto2)
            
            Text(titulo)
                .font(.system(size: 11))
                .fontWeight(.none)
                .foregroundColor(Color.texto2)
            
            Spacer()
        }
    }
}

