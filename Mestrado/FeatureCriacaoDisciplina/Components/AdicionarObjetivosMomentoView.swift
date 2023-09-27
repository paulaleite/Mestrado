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
    
//    /// Binding que contém a String do título do momento avaliativo.
//    @Binding var tituloMomento: String
//    /// Binding que contém a Data selecionada.
//    @Binding var data: Date
    var momento: MomentoAvaliativoPostDisciplinaModel
    
    /// Estado que permite determinar se a sheet de seleção de objetivos será apresentada.
    @State var mostrarLista: Bool = false
    
    // MARK: - Body da View
    var body: some View {
        Form {
            Section {
                AdicionarObjetivosMomentoCellView(mostrarLista: $mostrarLista)
                .listRowBackground(Color.fundo2)
            }
            
            ObjetivosMomentoSelecionadosView(momento: momento)
//            ObjetivosMomentoSelecionadosView(tituloMomento: $tituloMomento, data: $data)
        }
        .scrollContentBackground(.hidden)
        .background(Color.fundo1)
        .sheet(isPresented: $mostrarLista) {
//            EscolherObjetivosMomentoView(tituloMomento: $tituloMomento, data: $data)
            EscolherObjetivosMomentoView(momento: momento)
                .interactiveDismissDisabled(true)
        }
        .navigationTitle("Titulo.Objetivo.Adicionar".localized())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AdicionarObjetivosMomentoCellView: View {
    // MARK: - Variáveis e Constantes
    /// Binding que permite determinar se a sheet de seleção de objetivos será apresentada.
    @Binding var mostrarLista: Bool
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarLista.toggle()
        } label: {
            HStack {
                Text("Descricao.Objetivo.Adicionar".localized())
                    .foregroundColor(Color.texto1)
                    .font(.body)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.texto2)
            }
        }
        .buttonStyle(.plain)
    }
}

/// Estrutura que representa a Seção para apresentar os Objetivos de Aprendizado selecionados.
struct ObjetivosMomentoSelecionadosView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    var momento: MomentoAvaliativoPostDisciplinaModel
    
    /// Binding que contém a String do título do momento avaliativo.
//    @Binding var tituloMomento: String
//    /// Binding que contém a Data selecionada.
//    @Binding var data: Date
    
    /// Descricao da Data formatada de acordo com como ela foi enviada para o servidor.
//    var dataDescricao: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd MMM yyyy"
//        return dateFormatter.string(from: data)
//    }
    
    var data: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        guard let dataUnwrapped = dateFormatter.date(from: momento.data) else {
            return .now
        }
        return dataUnwrapped
    }
    
    /// Identificador do momento avaliativo atual que está sendo atualizado.
//    var momentoID: Int {
//        var id: Int = 0
//        for i in 0 ..< viewModel.momentoAvaliativo.count {
//            if viewModel.momentoAvaliativo[i].titulo == tituloMomento && viewModel.momentoAvaliativo[i].data == dataDescricao {
//                id = i
//            }
//        }
//        return id
//    }
    
    // MARK: - Body da View
    var body: some View {
        Section {
            if !momento.objetivos.isEmpty {
                ForEach(momento.objetivos, id: \.self) { obj in
                    ForEach(viewModel.objetivosDeAprendizadoDisponiveis, id: \.self) { objDisp in
                        if obj.id == objDisp.id {
                            ObjetivoSelecionadoDisciplinaCellView(tituloMomento: momento.titulo, data: data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(objDisp.corCompetencia), descricao: objDisp.descricao, objetivoID: obj.id), selecao: true, mostrarPicker: true)
                                .listRowBackground(Color.fundo2)
                        }
                    }
                }
            } else {
                Text("Titulo.Objetivo.Vazio".localized())
                    .foregroundColor(Color.texto1)
                    .font(.body)
                    .listRowBackground(Color.fundo2)
            }
//            if !viewModel.momentoAvaliativo[momentoID].objetivos.isEmpty {
//                ForEach(viewModel.momentoAvaliativo[momentoID].objetivos, id: \.self) { obj in
//                    ForEach(viewModel.objetivosDeAprendizadoDisponiveis, id: \.self) { objDisp in
//                        if obj.id == objDisp.id {
//                            ObjetivoSelecionadoDisciplinaCellView(tituloMomento: $tituloMomento, data: $data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(objDisp.corCompetencia), descricao: objDisp.descricao, objetivoID: obj.id), selecao: true, mostrarPicker: true)
//                                .listRowBackground(Color.fundo2)
//                        }
//                    }
//                }
//            } else {
//                Text("Titulo.Objetivo.Vazio".localized())
//                    .foregroundColor(Color.texto1)
//                    .font(.body)
//                    .listRowBackground(Color.fundo2)
//            }
        } header: {
            Text("Titulo.Objetivo.Selecionado".localized())
                .textCase(.uppercase)
                .font(.system(size: 12))
                .foregroundColor(Color.texto2)
        }
    }
}
