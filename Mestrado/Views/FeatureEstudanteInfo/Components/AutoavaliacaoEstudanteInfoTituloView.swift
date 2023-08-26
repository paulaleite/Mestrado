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
    
    /// Estado que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: String
    
    var body: some View {
        HStack {
            Text("Titulo.Autoavaliacao".localized())
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal, 16)
            
            NavigationLink {
                AutoavaliacaoEstudanteCriacaoView()
            } label: {
                Image(systemName: "plus.circle")
                    .font(.body)
                    .foregroundColor(Color.corDeAcao)
            }
            .padding(.trailing, 4)
            
            FiltroMomentos(dto: FiltroMomentosDTO(titulos: dto.titulos), momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                .padding(.trailing, 16)
        }
    }
}
