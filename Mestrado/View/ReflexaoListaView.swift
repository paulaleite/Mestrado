//
//  ReflexaoListaView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation
import SwiftUI


/// Configura uma lista de Reflexões do Estudante.
struct ReflexaoListaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var estudanteFetcher: EstudanteFetcher
    
    // MARK: - Body da View
    var body: some View {
        if let avaliacoes = estudanteFetcher.estudante?.autoavaliacoes {
            List(avaliacoes) { avaliacao in
                ReflexaoItemView(sentimento: avaliacao.sentimentoSelecionado, data: avaliacao.data, reflexaoTexto: avaliacao.reflexaoTextual)
            }
        } else {
            Text("Nenhuma autoavaliação realizada...")
        }
    }
}
