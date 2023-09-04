//
//  DisciplinasListView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

struct DisciplinasListView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    /// Identificador único da Pessoa
    var pessoa: LoginModel
    
    // MARK: - Body da View
    var body: some View {
        List(pessoa.disciplinas, id: \.self) { disciplina in
            NavigationLink {
                if viewModel.pessoa?.tipo == "Professor" {
                    ProfessorInfoView(disciplina: disciplina)
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if viewModel.pessoa?.tipo == "Professor" {
                    NavigationLink {
                        PostDisciplinaView()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.corDeAcao)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                    }

                }
            }
        }
    }
}
