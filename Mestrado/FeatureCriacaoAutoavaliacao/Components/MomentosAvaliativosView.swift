//
//  MomentosAvaliativosView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

/// Com essa visualização, é possível estruturar o Item de seleção dos Momentos Avaliativos para uma Autoavaliação.
struct MomentosAvaliativosView: View {
    // MARK: - Variáveis e Constantes
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: MomentoAvaliativoModel
    
    /// Lista dos Momentos Avaliativos disponíveis na Disciplina determinada.
    var momentos: [MomentoAvaliativoModel]
    
    // MARK: - Body da View
    
    var body: some View {
        NavigationLink {
            MomentosAvaliativosDetalheView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, momentos: momentos)
        } label: {
            HStack {
                Text("Titulo.Momento.Plural".localized())
                    .foregroundColor(Color.texto1)
                
                Spacer()
                
                if momentoAvaliativoSelecionado.titulo == "" {
                    Text("Descricao.Momento.Selecao".localized())
                } else {
                    Text(momentoAvaliativoSelecionado.titulo)
                        .foregroundColor(Color.texto2)
                }
            }
        }
    }
}
