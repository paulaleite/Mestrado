//
//  ObjetivosNaoAvaliadosView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização dos Objetivos de Aprendizado não avaliados, do Estudante.
struct ObjetivosNaoAvaliadosView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: EstudanteDetalhesViewModel
    
    // MARK: - Body da View
    var body: some View {
        ForEach(viewModel.objetivosNaoAvaliados, id: \.self) { objetivo in
            ObjetivoNaoAvaliadoView(dto: ObjetivoNaoAvaliadoDTO(corCompetencia: Color(objetivo.corDaCompetencia), descricao: objetivo.descricao))
        }
    }
}
