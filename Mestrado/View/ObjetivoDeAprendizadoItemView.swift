//
//  ObjetivoDeAprendizadoItemView.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation
import SwiftUI

struct ObjetivoDeAprendizadoItemDTO {
    var nomeCorCompetencia: String
    var descricaoObjetivoDeAprendizado: String
    var nivelRubricaObjetivoDeAprendizadoAvaliado: Rubrica
    var nivelRubricaEsperado: Rubrica
}

/// Configura a View de um Objetivo de Aprendizado.
struct ObjetivoDeAprendizadoItemView: View {
    
    // MARK: - Variáveis e Constantes
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pelo Item de Objetivo de Aprendizado DTO.
    let dto: ObjetivoDeAprendizadoItemDTO
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundColor(Color(dto.nomeCorCompetencia))
                    .padding(.top, 3)
                
                Text(dto.descricaoObjetivoDeAprendizado)
                    .font(.body)
                    .foregroundColor(Color("Texto1"))
            }
            
            HStack {
                Spacer()
                RubricaView(cor: Color(dto.nomeCorCompetencia), objetivoNivel: dto.nivelRubricaObjetivoDeAprendizadoAvaliado, nivelEsperado: dto.nivelRubricaEsperado, tamanho: [30, 10])
            }
        }
        .listRowBackground(Color("Fundo2"))
    }
}

struct ObjetivoDeAprendizadoItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(nomeCorCompetencia: "Competencia1", descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(nomeCorCompetencia: "Competencia1", descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(nomeCorCompetencia: "Competencia1", descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(nomeCorCompetencia: "Competencia1", descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            
        }
    }
}
