//
//  ContentView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Variáveis e Constantes
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    // MARK: - Body da View
    
    var body: some View {
        if let pessoa = loginViewModel.pessoa {
//            DisciplinasView(pessoaID: pessoa.id)
        } else {
            if loginViewModel.estaBuscando {
                LoadingView()
            } else {
                LoginView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
