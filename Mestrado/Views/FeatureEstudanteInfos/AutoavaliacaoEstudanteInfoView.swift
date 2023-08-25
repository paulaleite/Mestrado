//
//  AutoavaliacaoEstudanteView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

struct AutoavaliacaoEstudanteInfoView: View {
    
    // MARK: - Variáveis e Constantes
    
    @StateObject var viewModel: AutoavaliacaoEstudanteInfoViewModel
    
    var objetivos: [ObjetivoEstudanteInfoModel] {
        if momentoAvaliativoSelecionado == "Titulo.Momentos.Todos".localized() {
            return viewModel.objetivos
        } else {
            return viewModel.objetivos.filter {
                $0.momentoAvaliativo.contains(momentoAvaliativoSelecionado)
            }
        }
    }
    
    var reflexoes: [ReflexaoEstudanteInfoModel] {
        if momentoAvaliativoSelecionado == "Titulo.Momentos.Todos".localized() {
            return viewModel.reflexoes
        } else {
            return viewModel.reflexoes.filter {
                $0.momentoAvaliativo.contains(momentoAvaliativoSelecionado)
            }
        }
    }
    
    @State var sectionReflexoesExpandida: Bool = true
    @State var sectionObjetivosExpandida: Bool = true
    
    /// Estado que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: String
    
    // MARK: - Body da View
    var body: some View {
        List {
            Section {
                if sectionReflexoesExpandida && reflexoes.count > 0 {
                    ForEach(0 ..< reflexoes.count, id: \.self) { index in
                        ReflexaoItemView(dto: ReflexaoItemDTO(sentimento: reflexoes[index].sentimento, data: reflexoes[index].data, reflexaoTexto: reflexoes[index].descricao))
                    }
                }
            } header: {
                SectionHeaderView(titulo: "Reflexões", quantidade: reflexoes.count, sectionExpandida: $sectionReflexoesExpandida)
            }
            
            Section {
                if sectionObjetivosExpandida && objetivos.count > 0 {
                    ForEach(0 ..< objetivos.count, id: \.self) { index in
                        ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: Color(objetivos[index].corCompetencia), descricaoObjetivoDeAprendizado: objetivos[index].descricao, nivelRubricaObjetivoDeAprendizadoAvaliado: objetivos[index].rubricaSelecionada, nivelRubricaEsperado: objetivos[index].nivelEsperado))
                    }
                }
            } header: {
                SectionHeaderView(titulo: "Objetivos de Aprendizado", quantidade: objetivos.count, sectionExpandida: $sectionObjetivosExpandida)
            }
        }
        .background(Color.fundo1)
        
    }
}

//struct AutoavaliacaoEstudanteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AutoavaliacaoEstudanteInfoView(dto: AutoavaliacaoEstudanteInfoDTO(momentosAvaliativos: [MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 2", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 3", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 4", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 5", data: Date.now, objetivosDeAprendizado: [])], autoavaliacoes: [AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now)]))
//    }
//}
