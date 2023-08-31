//
//  SenhaLoginView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização que permite a Pessoa preencher a senha de seu login.
struct SenhaLoginView: View {
    // MARK: - Variáveis e Constantes
    /// Binding que permite o usuário digitar sua senha.
    @Binding var senha: String
    
    // MARK: - Body da View
    var body: some View {
        Section {
            SecureField("Titulo.Senha".localized(), text: $senha)
                .listRowBackground(Color.fundo2)
        } header: {
            Text("Descricao.Senha".localized())
                .font(.system(size: 14))
                .textCase(.none)
                .foregroundColor(Color.texto2)
        }
    }
}
