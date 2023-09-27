//
//  ObjetivoSelecionadoDisciplinaCellView.swift
//  Mestrado
//
//  Created by Paula Leite on 09/09/23.
//

import SwiftUI

/// Variáveis e Constantes que serão utilizadas pelo Item do Objetivo de Aprendizado para construir a visualização.
struct ObjetivoSelecionadoCellDTO {
    /// Cor que será utilizada no Círculo que identifica a competência do Objetivo de Aprendizado, bem como na visualização da Rubrica.
    let corCompetencia: Color
    /// Detalhamento da descrição do Objetivo de Aprendizado que está sendo apresentado no elemento da lista.
    let descricao: String
    /// Objetivo ID
    var objetivoID: String
    /// As rubricas disponíveis
    let rubricas: [Rubrica] = [.naoEstudado, .muitoSatisfeito, .parcialmenteSatisfeito, .nemSatisfeitoNemInsatisfeito, .parcialmenteInsatisfeito, .muitoInsatisfeito]
}

/// Visualização de um Objetivo de Aprendizado selecionado pelo Professor para fazer parte da Disciplina.
struct ObjetivoSelecionadoDisciplinaCellView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// String do título do momento avaliativo.
    var tituloMomento: String
    /// Data selecionada.
    var data: Date
    
    let dto: ObjetivoSelecionadoCellDTO
    
    /// Estado que representa a seleção e deseleação do Estudante na Disciplina.
    @State var selecao: Bool
    
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo apresentado no elemento da lista ou o Nível escolhido pelo Professor.
    @State var rubricaSelecionada: Rubrica = .naoEstudado
    
    /// Variável que permite saber se deveria mostrar o Picker ou não.
    var mostrarPicker: Bool
    
    /// Descricao da Data formatada de acordo com como ela foi enviada para o servidor.
    var dataDescricao: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: data)
    }
    
    // MARK: - Body da View
    var body: some View {
        HStack {
            Toggle(isOn: $selecao) {
                if !mostrarPicker {
                    Text("\(dto.descricao)")
                        .foregroundColor(Color.texto1)
                        .font(.body)
                }
            }
            .toggleStyle(CheckboxToggleStyle(corSelecionada: dto.corCompetencia, corDeselecionada: .secondary))
            .onChange(of: selecao, perform: { newValue in
                if newValue {
                    viewModel.atualizarMomentoAvaliativo(titulo: tituloMomento, data: dataDescricao, objetivo: ObjetivosPostDisciplinaModel(id: dto.objetivoID, nivelEsperado: rubricaSelecionada.rawValue))
                } else {
                    viewModel.removerObjetivo(titulo: tituloMomento, data: dataDescricao, objetivoID: dto.objetivoID)
                }
            })
            
            if mostrarPicker {
                Picker("\(dto.descricao)", selection: $rubricaSelecionada) {
                    ForEach(dto.rubricas, id: \.self) {
                        Text($0.titulo)
                    }
                }
                .tint(Color.texto2)
                .pickerStyle(.menu)
                .onChange(of: rubricaSelecionada, perform: { newValue in
                    viewModel.atualizarObjetivo(titulo: tituloMomento, data: data.description, objetivoID: dto.objetivoID, nivelEsperado: rubricaSelecionada)
                })
            }
        }
        .listRowBackground(Color.fundo2)
    }
}


