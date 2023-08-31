//
//  UsarioLoginView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização que permite a Pessoa de preencher o seu usuário de login.
struct UsarioLoginView: View {
    // MARK: - Variáveis e Constantes
    /// Binding que permite a Pessoa preencher o seu usuário de login.
    @Binding var usuario: String
    
    // MARK: - Body da View
    var body: some View {
        Section {
            TextField("Titulo.Usuario".localized(), text: $usuario, axis: .vertical)
                .listRowBackground(Color.fundo2)
        } header: {
            Text("Descricao.Usuario".localized())
                .font(.system(size: 14))
                .textCase(.none)
                .foregroundColor(Color.texto2)
        }
    }
}
