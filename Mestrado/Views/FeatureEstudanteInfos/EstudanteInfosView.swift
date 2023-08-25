//
//  EstudanteInfosView.swift
//  Mestrado
//
//  Created by Paula Leite on 25/08/23.
//

import SwiftUI

struct EstudanteInfosView: View {
    @ObservedObject var viewModel: AutoavaliacaoEstudanteInfoViewModel = AutoavaliacaoEstudanteInfoViewModel()
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = "Titulo.Momentos.Todos".localized()
    
    /// Variável computável que configura adiciona no começo da lista de momentos avaliativos, a opção de filtro com todos os objetivos.
    var momentos: [String] {
        var resultado: [String] = []
        for momentoAvaliativo in viewModel.momentosAvaliativos {
            resultado.append(momentoAvaliativo.titulo)
        }
        resultado.insert("Titulo.Momentos.Todos".localized(), at: 0)
        return resultado
    }
    
    init(estudanteID: String, disciplinaID: String) {
        viewModel.estudanteID = estudanteID
        viewModel.disciplinaID = disciplinaID
    }
    
    var body: some View {
        VStack {
            AutoavaliacaoEstudanteInfoTituloView(dto: FiltroMomentosDTO(titulos: self.momentos), momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
            
            AutoavaliacaoEstudanteInfoView(viewModel: viewModel, momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
        }
        .background(Color.fundo1)
    }
}
