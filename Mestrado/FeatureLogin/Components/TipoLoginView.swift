//
//  TipoLoginView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização que permite a Pessoa a selecionar quem ela é, entre Professor e Estudante
struct TipoLoginView: View {
    // MARK: - Variáveis e Constantes
    
    /// Binding que representa quem a Pessoa é, podendo ser Professor ou Estudante.
    @Binding var tipoSelecionado: String
    
    /// Lista das opções de quem a Pessoa pode ser, sendo  Professor ou Estudante.
    let tipos: [String] = ["Professor", "Estudante"]
    
    // MARK: - Body da View
    var body: some View {
        Section {
            Picker("Titulo.Tipo".localized(), selection: $tipoSelecionado) {
                ForEach(tipos, id: \.self) {
                    Text($0)
                }
            }
            .tint(Color.texto2)
            .pickerStyle(.menu)
            .listRowBackground(Color.fundo2)
        } header: {
            HStack(spacing: 2) {
                Text("*")
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                
                Text("Descricao.Tipo".localized())
                    .font(.system(size: 14))
                    .textCase(.none)
                    .foregroundColor(Color.texto2)
                
                Spacer()
            }
        }
    }
}
