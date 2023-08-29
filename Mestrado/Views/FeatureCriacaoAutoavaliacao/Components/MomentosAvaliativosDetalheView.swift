//
//  MomentosAvaliativosView.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import SwiftUI

/// Com essa visualização, é possível selecionar, dentre uma lista de Momentos Avaliativos, qual representa a Autoavaliação.
struct MomentosAvaliativosDetalheView: View {
    // MARK: - Variáveis e Constantes
    
    @Environment(\.dismiss) var dismiss
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    /// Lista dos Momentos Avaliativos disponíveis na Disciplina determinada.
    var titulosMomentos: [String]
    
    // MARK: - Body da View
    var body: some View {
        List {
            ForEach(titulosMomentos, id: \.self) { titulo in
                HStack {
                    Text(titulo)
                        .font(.body)
                    
                    Spacer()
                    
                    if momentoAvaliativoSelecionado == titulo {
                        Image(systemName: "checkmark")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.corDeAcao)
                    }
                }
                .background(Color.fundo2)
                .listRowBackground(Color.fundo2)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            momentoAvaliativoSelecionado = titulo
                            dismiss()
                    })
            }
        }
        .navigationTitle("Titulo.Momento".localized())
    }
}