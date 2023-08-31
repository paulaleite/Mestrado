//
//  BotaoLoginView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização do Botão de Login
struct BotaoLoginView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    /// Estado que representa quem a Pessoa é, podendo ser Professor ou Estudante.
    @Binding var tipoSelecionado: String
    /// Estado que permite a Pessoa preencher o seu usuário de login.
    @Binding var usuario: String
    /// Estado que permite a Pessoa digitar sua senha.
    @Binding var senha: String
    
    // MARK: - Body da View
    var body: some View {
        Section {
            Button {
                if usuario != "" || senha != "" {
                    Task {
                        await viewModel.getPessoa(pessoaID: usuario, senha: senha, tipo: tipoSelecionado)
                    }
                }
            } label: {
                Text("Titulo.Logar".localized())
                    .foregroundColor(Color.texto3)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(usuario == "" || senha == "" ? Color.texto2 : Color.corDeAcao)
            }
            .buttonStyle(.plain)
            .listRowBackground(usuario == "" || senha == "" ? Color.texto2 : Color.corDeAcao)
        }
    }
}
