//
//  ObjetivoDeAprendizadoItemView.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation
import SwiftUI

/// Variáveis e Constantes que serão utilizadas pelo Item do Objetivo de Aprendizado para construir a visualização.
struct ObjetivoDeAprendizadoItemDTO {
    /// Cor que será utilizada no Círculo que identifica a competência do Objetivo de Aprendizado, bem como na visualização da Rubrica.
    let corCompetencia: Color
    /// Detalhamento da descrição do Objetivo de Aprendizado que está sendo apresentado no elemento da lista.
    let descricaoObjetivoDeAprendizado: String
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo aprensetado no elemento da lista.
    let nivelRubricaObjetivoDeAprendizadoAvaliado: Rubrica
    /// A Rubrica escolhida pelo Professor, que o Estudante precisa atingir até o final da Disciplina.
    let nivelRubricaEsperado: Rubrica
}

/// Configura a View de um Objetivo de Aprendizado.
struct ObjetivoDeAprendizadoItemView: View {
    
    // MARK: - Variáveis e Constantes
    let dto: ObjetivoDeAprendizadoItemDTO
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundColor(dto.corCompetencia)
                    .padding(.top, 3)
                
                Text(dto.descricaoObjetivoDeAprendizado)
                    .font(.body)
                    .foregroundColor(Color("Texto1"))
            }
            
            HStack {
                Spacer()
                RubricaView(corCompetencia: dto.corCompetencia, objetivoNivel: dto.nivelRubricaObjetivoDeAprendizadoAvaliado, nivelEsperado: dto.nivelRubricaEsperado, tamanho: [30, 10])
            }
        }
        .listRowBackground(Color.fundo2)
    }
}

struct ObjetivoDeAprendizadoItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: .competencia1, descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: .competencia1, descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: .competencia1, descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            
            ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: .competencia1, descricaoObjetivoDeAprendizado: "Possuam sólida formação em Ciência da Computação e Matemática que os capacitem a construir aplicativos de propósito geral, ferramentas e infraestrutura de software de sistemas de computação e de sistemas embarcados, gerar conhecimento científico e inovação e que os incentivem a estender suas competências à medida que a área se desenvolve.", nivelRubricaObjetivoDeAprendizadoAvaliado: .nemSatisfeitoNemInsatisfeito, nivelRubricaEsperado: .muitoSatisfeito))
            
        }
    }
}
