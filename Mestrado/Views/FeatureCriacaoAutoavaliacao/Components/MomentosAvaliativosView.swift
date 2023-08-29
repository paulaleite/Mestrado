//
//  MomentosAvaliativosView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct MomentosAvaliativosView: View {
    // MARK: - Variáveis e Constantes
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    /// Lista dos Momentos Avaliativos disponíveis na Disciplina determinada.
    var titulosMomentos: [String]
    
    // MARK: - Body da View
    
    var body: some View {
        NavigationLink {
            MomentosAvaliativosDetalheView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, titulosMomentos: titulosMomentos)
        } label: {
            HStack {
                Text("Titulo.Momento.Plural".localized())
                    .foregroundColor(Color.texto1)
                
                Spacer()
                
                if momentoAvaliativoSelecionado == "" {
                    Text("Descricao.Momento.Selecao".localized())
                } else {
                    Text(momentoAvaliativoSelecionado)
                        .foregroundColor(Color.texto2)
                }
            }
        }
    }
}
