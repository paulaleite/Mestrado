//
//  GraficoBarrasEstudanteInfoView.swift
//  Mestrado
//
//  Created by Paula Leite on 26/08/23.
//

import SwiftUI
import Charts

/// Gráfico de Barras que representa a quantidade de objetivos de aprendizados concluídos em cada competência. Também possuí uma linha que apresenta a média da turma em cada competência.
struct GraficoBarrasEstudanteInfoView: View {
    // MARK: - Constantes e Variáveis
    
    @ObservedObject var viewModel: EstudanteInfoViewModel
    
    // MARK: - Body da View
    var body: some View {
        Chart(viewModel.qtdObjsPorCompetencia) { dado in
            BarMark(x: .value("Objetivos de Aprendizado", dado.qtdObjetivosConcluidos), y: .value("Competência", dado.titulo))
                .foregroundStyle(by: .value("Competência", dado.titulo))
            
            BarMark(x: .value("Objetivos de Aprendizado", dado.qtdObjetivosTotais), y: .value("Competência", dado.titulo))
                .foregroundStyle(Color.texto3)
                .annotation(position: .trailing) {
                    Text("\(dado.qtdObjetivosConcluidos) de \(dado.qtdObjetivosTotais)")
                        .foregroundColor(Color.texto2)
                        .font(.caption2)
                }
            
            RuleMark(x: .value("Média", dado.mediaDaTurma))
                .foregroundStyle(Color.texto2)
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                AxisValueLabel()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading) // TODO: Melhorar a altura do gráfico.
        .aspectRatio(1, contentMode: .fill)
        .padding(8)
        .background(Color.fundo2)
        .padding(.horizontal, 16)
        .cornerRadius(10)
    }
    
}
