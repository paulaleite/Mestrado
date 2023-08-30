//
//  AutoavaliacaoEstudanteInfoTituloView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

/// Visualização do Título e Botões utilizados para representar os Objetivos de Aprendizado avaliados pelo Estudante, bem como suas Reflexões.
struct AutoavaliacaoEstudanteInfoTituloView: View {
    
    // MARK: - Variáveis e Constantes
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pelo DTO do Filtro do Momento.
    var dto: FiltroMomentosDTO
    
    @ObservedObject var viewModel: EstudanteInfoViewModel
    
    /// Estado que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: String
    @State var abrirCriacaoAutoavaliacao: Bool = false
    
    var body: some View {
        HStack {
            Text("Titulo.Autoavaliacao".localized())
                .font(.title.bold())
                .foregroundColor(Color.texto1)
            
            Spacer()
            
            HStack {
                Button {
                    abrirCriacaoAutoavaliacao.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.body)
                        .foregroundColor(Color.corDeAcao)
                }
                
                FiltroMomentos(dto: FiltroMomentosDTO(titulos: dto.titulos), momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
            }
            
        }
        .sheet(isPresented: $abrirCriacaoAutoavaliacao) {
            AutoavaliacaoView(estudanteID: "1", disciplinaID: "1")
        }
    }
}
