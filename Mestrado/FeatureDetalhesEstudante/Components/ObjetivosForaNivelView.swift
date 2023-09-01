//
//  ObjetivosForaNivelView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização dos Objetivos de Aprendizado fora do Nível, do Estudante
struct ObjetivosForaNivelView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: EstudanteDetalhesViewModel
    
    // MARK: - Body da View
    var body: some View {
        ForEach(viewModel.objetivosForaDoNivelEsperado, id: \.self) { objetivo in
            ObjetivoItemView(dto: ObjetivoItemDTO(corCompetencia: Color(objetivo.corDaCompetencia), descricao: objetivo.descricao, rubricaSelecionada: objetivo.rubricaSelecionada, nivelEsperado: objetivo.nivelEsperado))
        }
    }
}
