//
//  ProfessorInfoView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

struct ProfessorInfoView: View {
    // MARK: - Variáveis e Constantes
    @StateObject var viewModel: ProfessorInfoViewModel = ProfessorInfoViewModel()
    
    /// Identificador único da Disciplina selecionada
    var disciplina: DisciplinaTituloModel
    
    // MARK: - Body da View
    var body: some View {
        List {
            GraficoProfessorSectionView()

        }
        .listSectionSeparator(.hidden)
        .background(Color.fundo1)
        .onAppear {
            Task {
                await viewModel.getDadosInfoProfessor(disciplinaID: disciplina.id)
            }
        }
        .foregroundColor(Color.texto1)
        .navigationTitle(disciplina.titulo)
        .environmentObject(viewModel)
    }
}
