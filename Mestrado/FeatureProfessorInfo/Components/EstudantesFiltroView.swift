//
//  EstudantesFiltroView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização do Segmented Control dos estudantes, de acordo com os que estão sem avaliação, abaixo do nível ou acima do nível.
struct EstudantesFiltroView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: ProfessorInfoViewModel
    
    /// Binding que permite saber qual Filtro está selecionado
    @Binding var filtro: String
    
    /// Identificador único da Disciplina
    var disciplinaID: String
    
    /// Variáveis que representa quais estudantes deveriam aparecer em cada cas
    var estudantes: [EstudanteFiltroModel] {
        var alunos: [EstudanteFiltroModel] = []
        
        if filtro == "Titulo.Todos".localized() {
            for aluno in viewModel.estudantesFiltro1 {
                alunos.append(aluno)
            }
        } else if filtro == "Titulo.Sem.Avaliacao".localized() {
            for aluno in viewModel.estudantesFiltro2 {
                alunos.append(aluno)
            }
        } else if filtro == "Titulo.Abaixo.Nivel".localized() {
            for aluno in viewModel.estudantesFiltro3 {
                alunos.append(aluno)
            }
        } else {
            for aluno in viewModel.estudantesFiltro4 {
                alunos.append(aluno)
            }
        }
        
        return alunos
    }
    
    // MARK: - Body da View
    var body: some View {
        ForEach(estudantes, id: \.self) { estudante in
            NavigationLink {
                EstudanteDetalhesView(estudanteID: estudante.id, disciplinaID: disciplinaID)
            } label: {
                ProfessorEstudanteInfoView(estudante: estudante)
            }
        }
    }
}
