//
//  SentimentosView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

/// Visualização que permite que o Estudante selecione seu Sentimento em relação ao Momento Avaliativo.
struct SentimentosView: View {
    // MARK: - Variáveis e Constantes
    
    /// Binding que reflete o sentimento selecionado pelo Estudante.
    @Binding var sentimentoSelecionado: Int
    
    /// Array com os sentimentos disponíveis.
    var sentimentos: [Sentimento]
    
    // MARK: - Body da View
    var body: some View {
        HStack {
            ForEach(self.sentimentos, id: \.self) { sentimento in
                Text(sentimento.description)
                    .font(.system(size: 45))
                    .grayscale(sentimentoSelecionado == sentimento.rawValue ? 0 : 1)
                    .scaleEffect(sentimentoSelecionado == sentimento.rawValue ? 1 : 0.8)
                    .frame(maxWidth: .infinity)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                sentimentoSelecionado = sentimento.rawValue
                            })
                    .animation(sentimentoSelecionado == sentimento.rawValue ? .easeIn(duration: 0.3) : .easeOut(duration: 0.3), value: sentimentoSelecionado)
            }
        }
    }
}
