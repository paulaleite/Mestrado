//
//  ContentView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        AutoavaliacaoEstudanteInfoView(dto: AutoavaliacaoEstudanteInfoDTO(momentosAvaliativos: [MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 2", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 3", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 4", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 5", data: Date.now, objetivosDeAprendizado: [])], autoavaliacoes: [AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now)]))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
