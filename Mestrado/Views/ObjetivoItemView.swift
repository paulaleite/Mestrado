//
//  ObjetivoDeAprendizadoItemView.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation
import SwiftUI

/// Variáveis e Constantes que serão utilizadas pelo Item do Objetivo de Aprendizado para construir a visualização.
struct ObjetivoItemDTO {
    /// Cor que será utilizada no Círculo que identifica a competência do Objetivo de Aprendizado, bem como na visualização da Rubrica.
    let corCompetencia: Color
    /// Detalhamento da descrição do Objetivo de Aprendizado que está sendo apresentado no elemento da lista.
    let descricao: String
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo aprensetado no elemento da lista.
    let rubricaSelecionada: Rubrica
    /// A Rubrica escolhida pelo Professor, que o Estudante precisa atingir até o final da Disciplina.
    let nivelEsperado: Rubrica
}

/// Configura a View de um Objetivo de Aprendizado.
struct ObjetivoItemView: View {
    
    // MARK: - Variáveis e Constantes
    let dto: ObjetivoItemDTO
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundColor(dto.corCompetencia)
                    .padding(.top, 3)
                
                Text(dto.descricao)
                    .font(.body)
                    .foregroundColor(Color("Texto1"))
            }
            .listRowBackground(Color.fundo2)
            
            HStack {
                Spacer()
                RubricaView(corCompetencia: dto.corCompetencia, objetivoNivel: dto.rubricaSelecionada, nivelEsperado: dto.nivelEsperado, tamanho: [30, 10])
            }
        }
    }
}
