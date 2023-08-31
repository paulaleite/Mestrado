//
//  LoginView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização da Tela de Login de uma Pessoa.
struct LoginView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    /// Estado que representa quem a Pessoa é, podendo ser Professor ou Estudante.
    @State var tipoSelecionado = ""
    /// Estado que permite a Pessoa preencher o seu usuário de login.
    @State var usuario = ""
    /// Estado que permite a Pessoa digitar sua senha.
    @State var senha = ""
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            Form {
                TipoLoginView(tipoSelecionado: $tipoSelecionado)
                
                UsarioLoginView(usuario: $usuario)
                
                SenhaLoginView(senha: $senha)
                
                BotaoLoginView(tipoSelecionado: $tipoSelecionado, usuario: $usuario, senha: $senha)
            }
            .scrollContentBackground(.hidden)
            .background(Color.fundo1)
            .navigationTitle("Descricao.Login".localized())
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
