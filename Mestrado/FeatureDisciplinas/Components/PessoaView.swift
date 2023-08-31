//
//  PessoaView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização que permite a Pessoa deslogar de sua conta.
struct PessoaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    /// Estado que reflete se o Alert de confirmação da ação de deslogar vai ser chamado.
    @State var mostrarAlert: Bool = false
    
    // MARK: - Body da View
    var body: some View {
        VStack(alignment: .center) {
            Button {
                mostrarAlert.toggle()
            } label: {
                Text("Titulo.Deslogar".localized())
            }
        }
        .alert(isPresented: $mostrarAlert) {
            Alert(title: Text("Alert.Titulo.Deslogar".localized()), message: Text("Alert.Mensagem.Deslogar".localized()), primaryButton: .default(Text("Titulo.Cancelar".localized())), secondaryButton: .destructive(Text("Titulo.Deslogar".localized())) {
                viewModel.removerPessoa()
            })
        }
    }
}
