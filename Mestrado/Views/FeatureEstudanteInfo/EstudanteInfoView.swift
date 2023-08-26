//
//  EstudanteInfosView.swift
//  Mestrado
//
//  Created by Paula Leite on 25/08/23.
//

import SwiftUI

/// Com essa visualização, o Estudante consegue encontrar todas as Informações referentes à Disciplina selecionada. Sendo um gráfico que representa a quantidade de objetivos de aprendizados concluídos em cada competência e os resultados de todas as suas autoavaliações.
struct EstudanteInfoView: View {
    // MARK: - Constantes e Variáveis
    
    @ObservedObject var viewModel: EstudanteInfoViewModel = EstudanteInfoViewModel()
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = "Titulo.Momentos.Todos".localized()
    
    // MARK: - Inicializadores
    
    init(estudanteID: String, disciplinaID: String) {
        viewModel.estudanteID = estudanteID
        viewModel.disciplinaID = disciplinaID
    }
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                Text("Competências".localized())
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                
                GraficoBarrasEstudanteInfoView(viewModel: viewModel)
                    .padding(.bottom, 16)
                
                AutoavaliacaoEstudanteInfoView(viewModel: viewModel, momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
            }
            .background(Color.fundo1)
            .navigationTitle("Disciplina 1")
        }
        .background(Color.fundo1)
    }
}
