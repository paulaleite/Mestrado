//
//  ObjetivoDeAprendizadoListaView.swift
//  Mestrado
//
//  Created by Paula Leite on 21/07/23.
//

import Foundation
import SwiftUI

/// Configura uma lista de Objetivos de Aprendizado.
struct ObjetivoDeAprendizadoListaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var estudanteFetcher: EstudanteFetcher
    
    // MARK: - Body da View
    var body: some View {
        if let objetivos = estudanteFetcher.estudante? {
            List(objetivos) { objetivo in
                ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: <#T##Color#>, descricaoObjetivoDeAprendizado: <#T##String#>, nivelRubricaObjetivoDeAprendizadoAvaliado: <#T##Rubrica#>, nivelRubricaEsperado: <#T##Rubrica#>))
            }
        } else {
            Text("Nenhuma autoavaliação realizada...")
        }
    }
}
