//
//  LoginView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    @State var tipoSelecionado = ""
    @State var usuario = ""
    @State var senha = ""
    
    var tipos: [String] = ["Professor", "Estudante"]
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Quem é você?", selection: $tipoSelecionado) {
                        ForEach(tipos, id: \.self) {
                            Text($0)
                        }
                    }
                    .tint(Color.texto2)
                    .pickerStyle(.menu)
                    .listRowBackground(Color.fundo2)
                } header: {
                    Text("Você é professor ou estudante? 🎓")
                        .font(.system(size: 14))
                        .textCase(.none)
                        .foregroundColor(Color.texto2)
                }
                
                Section {
                    TextField("Usuário", text: $usuario, axis: .vertical)
                        .listRowBackground(Color.fundo2)
                } header: {
                    Text("Informe o seu usuário, que foi pré-disponibilizado. 👤")
                        .font(.system(size: 14))
                        .textCase(.none)
                        .foregroundColor(Color.texto2)
                }
                
                Section {
                    SecureField("Senha", text: $senha)
                        .listRowBackground(Color.fundo2)
                } header: {
                    Text("Informe a sua senha, que foi pré-disponibilizada. 🤫")
                        .font(.system(size: 14))
                        .textCase(.none)
                        .foregroundColor(Color.texto2)
                }
                
                Section {
                    Button {
                        Task {
                            await viewModel.getPessoa(pessoaID: usuario, senha: senha, tipo: tipoSelecionado)
                        }
                    } label: {
                        Text("Logar")
                            .foregroundColor(Color.texto3)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .buttonStyle(.plain)
                    .listRowBackground(Color.corDeAcao)
                }
                
            }
            .scrollContentBackground(.hidden)
            .background(Color.fundo1)
            .navigationTitle("Faça seu Login")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
