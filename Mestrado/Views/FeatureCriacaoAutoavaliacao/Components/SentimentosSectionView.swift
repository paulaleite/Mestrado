//
//  SentimentosSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct SentimentosSectionView: View {
    // MARK: - Variáveis e Constantes
    /// Binding que reflete o sentimento selecionado pelo Estudante.
    @Binding var sentimentoSelecionado: Int
    /// Binding que reflete o texto da reflexão do Estudante.
    @Binding var descricaoReflexao: String
    
    var sentimentos: [Sentimento]
    
    // MARK: - Body da View
    var body: some View {
        Section {
            SentimentosView(sentimentoSelecionado: $sentimentoSelecionado, sentimentos: sentimentos)
                .listRowBackground(Color.fundo2)
            
            TextField("Descricao.Reflexao".localized(), text: $descricaoReflexao, axis: .vertical)
                .listRowBackground(Color.fundo2)
                .frame(minHeight: 100, maxHeight: 100, alignment: .topLeading)
            
        } header: {
            Text("Titulo.Reflexao".localized())
                .listRowSeparator(.hidden)
                .foregroundColor(Color.texto2)
                .listRowBackground(Color.fundo1)
                .font(.system(size: 14))
                .textCase(.uppercase)
        }
        
        
//        Section {
//            TextField("Descricao.Reflexao".localized(), text: $descricaoReflexao, axis: .vertical)
//                .listRowSeparator(.hidden)
//                .listRowBackground(Color.fundo2)
//                .frame(minHeight: 100, maxHeight: 100, alignment: .topLeading)
//        }
    }
}
