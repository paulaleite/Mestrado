//
//  DisciplinasView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

struct DisciplinasView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    /// Identificador único da Pessoa
    var pessoa: LoginModel
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            List(pessoa.disciplinas, id: \.self) { disciplina in
                NavigationLink {
                    if viewModel.pessoa?.tipo == "Professor" {
                        EmptyView()
                    } else {
                        EstudanteInfoView(estudanteID: pessoa.id, disciplinaID: disciplina.id)
                    }
                } label: {
                    Text(disciplina.titulo)
                        .foregroundColor(Color.texto1)
                }
                .listRowBackground(Color.fundo2)
            }
            .scrollContentBackground(.hidden)
            .background(Color.fundo1)
            .navigationTitle("Disciplinas")
        }
    }
}
