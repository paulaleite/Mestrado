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
            
            BarMark(x: .value("Objetivos de Aprendizado", dado.qtdObjetivosConcluidos), y: .value("Competência", "\(dado.titulo): \(dado.qtdObjetivosConcluidos) de \(dado.qtdObjetivosTotais)"), width: .fixed(12))
                .foregroundStyle(Color(dado.corCompetencia))
            
            BarMark(x: .value("Objetivos de Aprendizado", dado.qtdObjetivosTotais), y: .value("Competência", "\(dado.titulo): \(dado.qtdObjetivosConcluidos) de \(dado.qtdObjetivosTotais)"), width: .fixed(12))
                .foregroundStyle(Color.fundo4)
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                AxisValueLabel()
            }
        }
        .chartOverlay(content: { proxy in
            Chart(viewModel.qtdObjsPorCompetencia) { dado in
                BarMark(x: .value("Média", dado.mediaDaTurma), y: .value("Competência", "\(dado.titulo): \(dado.qtdObjetivosConcluidos) de \(dado.qtdObjetivosTotais)"), width: .fixed(0))
                    .annotation(position: .trailing) {
                        Rectangle()
                            .frame(width: 1, height: 20)
                    }
                BarMark(x: .value("Objetivos de Aprendizado", dado.qtdObjetivosTotais), y: .value("Competência", "\(dado.titulo): \(dado.qtdObjetivosConcluidos) de \(dado.qtdObjetivosTotais)"), width: .fixed(0))
            }
            .frame(maxHeight: 200, alignment: .leading)
            .aspectRatio(1, contentMode: .fill)
            .chartLegend(.hidden)
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks { _ in
                    AxisValueLabel()
                }
            }
            
        })
        .frame(maxHeight: 200, alignment: .leading)
        .aspectRatio(1, contentMode: .fill)
    }
    
}
