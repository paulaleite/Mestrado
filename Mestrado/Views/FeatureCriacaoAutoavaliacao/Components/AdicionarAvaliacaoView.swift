//
//  AdicionarAvaliacaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct AdicionarAvaliacaoView: View {
    // MARK: - Variáveis e Constantes
    
    @Environment(\.dismiss) var dismiss
    
    /// Binding que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: String
    /// Binding que reflete o texto da reflexão do Estudante.
    @Binding var descricaoReflexao: String
    
    // MARK: - Body da View
    var body: some View {
        Button {
            dismiss()
            // TODO: Chamar pop-up
        } label: {
            Text("Titulo.Concluido".localized())
                .foregroundColor((momentoAvaliativoSelecionado == "Descricao.Momento.Selecao".localized() || descricaoReflexao.isEmpty) ? Color.texto2 : Color.corDeAcao)
        }
        .disabled((momentoAvaliativoSelecionado == "Descricao.Momento.Selecao".localized() || descricaoReflexao.isEmpty) ? true : false)
    }
}
