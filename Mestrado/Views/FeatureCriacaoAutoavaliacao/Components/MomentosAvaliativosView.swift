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
