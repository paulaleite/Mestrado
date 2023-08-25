//
//  AutoavaliacaoEstudanteView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

//struct AutoavaliacaoEstudanteInfoDTO {
//    /// Lista de Momentos Avaliativos da Disciplina do Estudante.
//    var momentosAvaliativos: [MomentoAvaliativo]
//
//    var autoavaliacoes: [AutoAvaliacao]
//}

struct AutoavaliacaoEstudanteInfoView: View {
    
    // MARK: - Variáveis e Constantes
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pela Autoavaliacao Estudante Info DTO.
//    let dto: AutoavaliacaoEstudanteInfoDTO
    
    @StateObject var viewModel: AutoavaliacaoEstudanteInfoViewModel = AutoavaliacaoEstudanteInfoViewModel()
    
    init(estudanteId: String) {
        viewModel.estudanteId = estudanteId
    }
    
    /// Variável computável que configura adiciona no começo da lista de momentos avaliativos, a opção de filtro com todos os objetivos.
    var momentos: [String] {
        var resultado: [String] = []
        for momentoAvaliativo in viewModel. {
            resultado.append(momentoAvaliativo.titulo)
        }
        resultado.insert("Titulo.Momentos.Todos".localized(), at: 0)
        return resultado
    }
    
    @State var sectionReflexoesExpandida: Bool = true
    @State var sectionObjetivosExpandida: Bool = true
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = "Titulo.Momentos.Todos".localized()
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            VStack {
                AutoavaliacaoEstudanteInfoTituloView(dto: FiltroMomentosDTO(titulos: momentos), momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                
                List {
                    Section {
                        if sectionReflexoesExpandida {
                            ForEach(viewModel.) { autoavaliacao in

                                ReflexaoItemView(dto: ReflexaoItemDTO(sentimento: autoavaliacao.sentimentoSelecionado, data: autoavaliacao.data, reflexaoTexto: autoavaliacao.reflexaoTextual))
                            }
                        }
                    } header: {
                        SectionHeaderView(titulo: "Reflexões", sectionExpandida: $sectionReflexoesExpandida)
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        if sectionObjetivosExpandida {
                            ForEach(dto.autoavaliacoes) { autoavaliacao in
                                ForEach(autoavaliacao.objetivosDeAprendizadoSendoAvaliados) { objetivo in
                                    ObjetivoDeAprendizadoItemView(dto: ObjetivoDeAprendizadoItemDTO(corCompetencia: Color(objetivo.objetivoDeAprendizado.corCompetencia ?? "Competencia1"), descricaoObjetivoDeAprendizado: objetivo.objetivoDeAprendizado.descricao, nivelRubricaObjetivoDeAprendizadoAvaliado: objetivo.rubricaSelecionada, nivelRubricaEsperado: objetivo.objetivoDeAprendizado.nivelEsperado ?? Rubrica.naoEstudado))
                                }
                            }
                        }
                    } header: {
                        SectionHeaderView(titulo: "Objetivos de Aprendizado", sectionExpandida: $sectionObjetivosExpandida)
                    }
                    .headerProminence(.increased)

                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.fundo1)
        }
    }
}

struct AutoavaliacaoEstudanteView_Previews: PreviewProvider {
    static var previews: some View {
        AutoavaliacaoEstudanteInfoView(dto: AutoavaliacaoEstudanteInfoDTO(momentosAvaliativos: [MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 2", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 3", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 4", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 5", data: Date.now, objetivosDeAprendizado: [])], autoavaliacoes: [AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now), AutoAvaliacao(id: "", objetivosDeAprendizadoSendoAvaliados: [], sentimentoSelecionado: .amei, reflexaoTextual: "Essa é a reflexão que o aluno fez no momento específico que está destacado logo acima, então um tamanho grande levaria essa caixa de texto a aumentar um pouco mais, garantindo que tudo aparecesse aqui. Isso vai ser interessante. O tamanho da fonte foi pensado com cuidado, para que funcione de forma.", momentoAvaliativo: MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), data: Date.now)]))
    }
}
