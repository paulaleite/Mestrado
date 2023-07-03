//
//  ReflexaoListaView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation
import SwiftUI

/**
 Configura uma lista de Reflexões do Estudante
 */
struct ReflexaoListaView: View {
    // MARK: - Body da View
    var body: some View {
        List {
            ReflexaoItemView(sentimento: .amei, reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
            ReflexaoItemView(sentimento: .amei, reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
            ReflexaoItemView(sentimento: .amei, reflexaoTexto: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.")
        }
    }
}

struct ReflexaoListaView_Previews: PreviewProvider {
    
    static var previews: some View {
        ReflexaoListaView()
    }
}
