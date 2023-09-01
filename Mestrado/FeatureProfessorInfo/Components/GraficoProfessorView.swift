//
//  GraficoProfessorView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI
import Charts

struct GraficoProfessorView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: ProfessorInfoViewModel
    
    // MARK: - Body da View
    var body: some View {
        Chart(viewModel.dadosGrafico, id: \.self) { dado in
            BarMark(x: .value("Competência", dado.titulo), y: .value("Quantidade de Objetivos", dado.qtdObjetivos))
                .foregroundStyle(Color(dado.corCompetencia))
        }
        .frame(maxHeight: 250, alignment: .center)
        .aspectRatio(1, contentMode: .fill)
        .listRowBackground(Color.fundo2)
    }
}
