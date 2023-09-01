//
//  ObjetivoNaoAvaliadoView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Variáveis e Constantes que serão utilizadas pelo Objetivo de Aprendizado Não Avaliado para construir a visualização.
struct ObjetivoNaoAvaliadoDTO {
    /// Cor que será utilizada no Círculo que identifica a competência do Objetivo de Aprendizado, bem como na visualização da Rubrica.
    var corCompetencia: Color
    /// Detalhamento da descrição do Objetivo de Aprendizado que está sendo apresentado no elemento da lista.
    var descricao: String
}

/// Visualização do Objetivo de Aprendizado não avaliado pelo Estudante.
struct ObjetivoNaoAvaliadoView: View {
    // MARK: - Variáveis e Constantes
    var dto: ObjetivoNaoAvaliadoDTO
    
    // MARK: - Body da View
    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .frame(width: 13, height: 13)
                .foregroundColor(dto.corCompetencia)
                .padding(.top, 3)
            
            Text(dto.descricao)
                .font(.body)
                .foregroundColor(Color.texto1)
        }
        .listRowBackground(Color.fundo2)
    }
}
