//
//  MomentosAvaliativosView.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import SwiftUI

/// Com essa visualização, é possível selecionar, dentre uma lista de Momentos Avaliativos, qual representa a Autoavaliação.
struct MomentosAvaliativosView: View {
    // MARK: - Variáveis e Constantes
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    /// Lista dos Momentos Avaliativos disponíveis na Disciplina determinada.
    var titulosMomentos: [String]
    
    // MARK: - Body da View
    var body: some View {
        Picker("Momentos", selection: $momentoAvaliativoSelecionado) {
            ForEach(titulosMomentos, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.navigationLink)
        
        .navigationTitle("Momentos".localized())
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// Essa é a visualização da célula do Momento Avaliativo quando possuí o checkmark.
struct MomentoCheckCellView: View {
    
    /// Momento Avaliativo da célula específica.
    let momento: MomentoAvaliativoTituloModel
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    var body: some View {
        HStack {
            Text(momento.titulo)
                .foregroundColor(Color.texto1)
            Spacer()
            if momento.titulo == momentoAvaliativoSelecionado {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.corDeAcao)
                    .fontWeight(.semibold)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture {
            self.momentoAvaliativoSelecionado = momento.titulo
        }
    }
}
