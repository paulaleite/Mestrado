//
//  AdicionarObjetivosMomentoView.swift
//  Mestrado
//
//  Created by Paula Leite on 08/09/23.
//

import SwiftUI

/// Visualização que permite o Professor adicionar Objetivos ao Momento Avaliativo e visualizar os objetivos que já foram adicionar, selecionando seus níveis esperados.
struct AdicionarObjetivosMomentoView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
    var dataDescricao: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: data)
    }
    
    var momentoID: Int {
        var id: Int = 0
        for i in 0 ..< viewModel.momentoAvaliativo.count {
            if viewModel.momentoAvaliativo[i].titulo == tituloMomento && viewModel.momentoAvaliativo[i].data == dataDescricao {
                id = i
            }
        }
        return id
    }
    
    // MARK: - Body da View
    var body: some View {
        Form {
            Section {
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Descricao.Objetivo.Adicionar".localized())
                        .foregroundColor(Color.texto1)
                        .font(.body)
                }
                .listRowBackground(Color.fundo2)
            }
            
            if !viewModel.momentoAvaliativo[momentoID].objetivos.isEmpty {
                Section {
                    ForEach(viewModel.momentoAvaliativo[momentoID].objetivos, id: \.self) { obj in
                        ForEach(viewModel.objetivosDeAprendizadoDisponiveis, id: \.self) { objDisp in
                            if obj.id == objDisp.id {
                                ObjetivoSelecionadoDisciplinaCellView(tituloMomento: $tituloMomento, data: $data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(objDisp.corCompetencia), descricao: objDisp.descricao, objetivoID: obj.id))
                            }
                        }
                    }
                } header: {
                    Text("Titulo.Objetivo.Selecionado".localized())
                        .textCase(.uppercase)
                        .font(.system(size: 12))
                        .foregroundColor(Color.texto2)
                }
            }
        }
    }
}


/// Visualização de um Objetivo de Aprendizado selecionado pelo Professor para fazer parte da Disciplina.
struct ObjetivoSelecionadoDisciplinaCellView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
    let dto: ObjetivoSelecionadoCellDTO
    
    /// Binding que representa a seleção e deseleação do Estudante na Disciplina.
    @State var selecao: Bool = true
    
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo apresentado no elemento da lista ou o Nível escolhido pelo Professor.
    @State var rubricaSelecionada: Rubrica = .naoEstudado
    
    // MARK: - Body da View
    var body: some View {
        Toggle(isOn: $selecao) {
            Picker("\(dto.descricao)", selection: $rubricaSelecionada) {
                ForEach(dto.rubricas, id: \.self) {
                    Text($0.titulo)
                }
            }
            .tint(Color.texto2)
            .pickerStyle(.menu)
        }
        .toggleStyle(CheckboxToggleStyle(corSelecionada: dto.corCompetencia, corDeselecionada: .secondary))
        .onChange(of: rubricaSelecionada, perform: { newValue in
            viewModel.atualizarObjetivo(titulo: tituloMomento, data: data.description, objetivoID: dto.objetivoID, nivelEsperado: rubricaSelecionada)
        })
        .listRowBackground(Color.fundo2)
    }
}

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

