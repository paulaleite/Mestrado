//
//  ReflectionCellView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation
import SwiftUI

/**
 Configura o Item específico de uma Reflexão
 - Parameter sentimento: O sentimento configurado pelo estudante, do tipo Sentimento
 - Parameter data: A data configurada pelo estudante, do tipo Date
 - Parameter reflexaoText: A reflexão configurada pelo estudante, do tipo String
 */
struct ReflexaoItemView: View {
    
    // MARK: - Variáveis e Constantes
    let sentimento: Sentimento
    let data: Date = Date(timeIntervalSinceReferenceDate: -123456789.0)
    let reflexaoTexto: String
    
    // MARK: - Body da View
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text(sentimento.description)
                    .font(.title3)
                    .padding(.top, 16)
                
                Spacer()
                
                Text(data, format: .dateTime.day().month().year())
                    .font(.caption2)
            }
            
            Text(reflexaoTexto)
                .font(.body)
                .padding(.top, 16)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct ReflectionCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        ReflexaoItemView(sentimento: .amei, reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
    }
}
