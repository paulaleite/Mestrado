//
//  DisciplinasView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização que permite que a Pessoa consultar todas as Disciplinas que faz parte, bem como a opção de deslogar.
struct DisciplinasView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: LoginViewModel
    
    /// Identificador único da Pessoa
    var pessoa: LoginModel
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            DisciplinasListView(pessoa: pessoa)
                .navigationTitle("Titulo.Disciplina.Plural".localized())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        PessoaBotaoView()
                    }
                }
        }
    }
}
