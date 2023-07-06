//
//  ObjetivoDeAprendizadoItemView.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation
import SwiftUI

/// Configura a View de um Objetivo de Aprendizado.
struct ObjetivoDeAprendizadoItemView: View {
    var nomeCorCompetencia: String
    var descricaoObjetivoDeAprendizado: String
    var nivelRubricaObjetivoDeAprendizado: Rubrica
    var nivelRubricaEsperado: Rubrica

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundColor(Color(nomeCorCompetencia))
                
                Text(descricaoObjetivoDeAprendizado)
                    .font(.body)
            }
            
            
        }
    }
}

struct ObjetivoDeAprendizadoItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ObjetivoDeAprendizadoItemView(nomeCorCompetencia: "Competencia1", descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito)
    }
}
