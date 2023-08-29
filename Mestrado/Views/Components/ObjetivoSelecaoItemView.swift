//
//  ObjetivoSelecaoItemView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

/// Variáveis e Constantes que serão utilizadas pelo Item do Objetivo de Aprendizado para construir a visualização.
struct ObjetivoSelecaoItemDTO {
    /// Cor que será utilizada no Círculo que identifica a competência do Objetivo de Aprendizado, bem como na visualização da Rubrica.
    let corCompetencia: Color
    /// Detalhamento da descrição do Objetivo de Aprendizado que está sendo apresentado no elemento da lista.
    let descricao: String
    /// A rubrica selecionada pelo Estudante.
    var rubricaEstudante: Rubrica
    /// As rubricas disponíveis
    let rubricas: [Rubrica] = [.naoEstudado, .muitoSatisfeito, .parcialmenteSatisfeito, .nemSatisfeitoNemInsatisfeito, .parcialmenteInsatisfeito, .muitoInsatisfeito]
}

/// Configura a View de um Objetivo de Aprendizado.
struct ObjetivoSelecaoItemView: View {
    
    // MARK: - Variáveis e Constantes
    let dto: ObjetivoSelecaoItemDTO
    
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo apresentado no elemento da lista ou o Nível escolhido pelo Professor.
    @State var rubricaSelecionada: Rubrica = .naoEstudado
    
    var body: some View {
        
        HStack(alignment: .top) {
            Circle()
                .frame(width: 13, height: 13)
                .foregroundColor(dto.corCompetencia)
                .padding(.top, 3)
            
            Picker("\(dto.descricao)", selection: $rubricaSelecionada) {
                ForEach(dto.rubricas, id: \.self) {
                    Text($0.titulo)
                }
            }
            .tint(Color.texto2)
            .pickerStyle(.menu)
            .onAppear {
                if dto.rubricaEstudante.rawValue != 0 {
                    rubricaSelecionada = dto.rubricaEstudante
                }
            }
        }
        .listRowBackground(Color.fundo2)
    }
}
