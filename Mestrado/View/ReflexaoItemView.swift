//
//  ReflectionCellView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation
import SwiftUI


/// Configura o Item específico de uma Reflexão.
struct ReflexaoItemView: View {
    
    // MARK: - Variáveis e Constantes
    /// O sentimento configurado pelo estudante, do tipo Sentimento.
    let sentimento: Sentimento
    /// A data configurada pelo estudante, do tipo Date.
    let data: Date
    /// A reflexão configurada pelo estudante, do tipo String.
    let reflexaoTexto: String
    
    // MARK: - Body da View
    var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .bottom) {
                Text(sentimento.description)
                    .font(.title3)
                    .foregroundColor(Color("Texto1"))
                
                Spacer()
                
                Text(data, format: .dateTime.day().month().year())
                    .font(.caption2)
                    .foregroundColor(Color("Texto2"))
            }
            
            Text(reflexaoTexto)
                .font(.body)
                .foregroundColor(Color("Texto1"))
        }
    }
}

struct ReflectionCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ReflexaoItemView(sentimento: .amei, data: Date(timeIntervalSinceReferenceDate: -123456789.0), reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
            ReflexaoItemView(sentimento: .amei, data: Date(timeIntervalSinceReferenceDate: -123456789.0), reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
            ReflexaoItemView(sentimento: .amei, data: Date(timeIntervalSinceReferenceDate: -123456789.0), reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
        }
    }
}
