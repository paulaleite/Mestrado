//
//  EscolherObjetivosMomentoView.swift
//  Mestrado
//
//  Created by Paula Leite on 08/09/23.
//

import SwiftUI

/// Visualização que permite o Professor encontrar todos os Objetivos de Aprendizado disponíveis para serem selecionados.
struct EscolherObjetivosMomentoView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
    /// Texto da busca que vai ser atualizado sempre que o usuário mudá-lo.
    @State var textoBusca: String = ""
    
    var resultadoBusca: [ObjetivoGetPostDisciplinaModel] {
        if textoBusca.isEmpty {
            return viewModel.objetivosDeAprendizadoDisponiveis
        } else {
            return viewModel.objetivosDeAprendizadoDisponiveis.filter {
                $0.descricao.contains(textoBusca)
            }
        }
    }
    
    /// Descricao da Data formatada de acordo com como ela foi enviada para o servidor.
    var dataDescricao: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: data)
    }
    
    /// Identificador do momento avaliativo atual que está sendo atualizado.
    var momentoID: Int {
        var id: Int = 0
        for i in 0 ..< viewModel.momentoAvaliativo.count {
            if viewModel.momentoAvaliativo[i].titulo == tituloMomento && viewModel.momentoAvaliativo[i].data == dataDescricao {
                id = i
            }
        }
        return id
    }
    
    var objetivoSelecionado: Bool {
        var resultado: Bool = false
        
        for par in agruparPorCategoria(resultadoBusca) {
            for obj in par.1 {
                for objetivo in viewModel.momentoAvaliativo[momentoID].objetivos {
                    if obj.id == objetivo.id {
                        resultado = true
                    } else {
                        resultado = false
                    }
                }
            }
        }
        
        return resultado
    }
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            List {
                ForEach(agruparPorCategoria(resultadoBusca), id: \.0) { par in
                    Section {
                        ForEach(par.1, id: \.self) { obj in
                            if viewModel.momentoAvaliativo[momentoID].objetivos.contains(where: { $0.id == obj.id }) {
                                ObjetivoSelecionadoDisciplinaCellView(tituloMomento: $tituloMomento, data: $data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(obj.corCompetencia), descricao: obj.descricao, objetivoID: obj.id), selecao: true, mostrarPicker: false)
                            } else {
                                ObjetivoSelecionadoDisciplinaCellView(tituloMomento: $tituloMomento, data: $data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(obj.corCompetencia), descricao: obj.descricao, objetivoID: obj.id), selecao: false, mostrarPicker: false)
                            }
                        }
                    } header: {
                        Text(par.0)
                            .font(.system(size: 11))
                            .foregroundColor(Color.texto2)
                    }
                }
            }
            .searchable(text: $textoBusca)
            .scrollContentBackground(.hidden)
            .background(Color.fundo1)
            .navigationTitle("Titulo.Disciplina.Nova".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    AlertView(tituloBotao: "Titulo.Concluido".localized(), tituloAlert: "Alert.Titulo.Objetivos.Adicionar.Adicionar".localized(), mensageAlert: "Alert.Mensagem.Objetivos.Adicionar.Adicionar".localized(), tituloBotaoAlert: "Titulo.Editar".localized(), tituloBotaoSecundarioAlert: "Titulo.Salvar".localized(), cor: Color.corDeAcao)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getDadosCriacaoDisciplina()
            }
        }
    }
    
    // MARK: - Funçõoes
    
    /// Agrupa os objetivos de acordo com as Competências.
    /// - Parameter objetivos: Lista de todos os Objetivos de Aprendizado
    /// - returns: Dicionário de String que representam a Competência e os Objetivos agrupados.
    func agruparPorCategoria(_ objetivos: [ObjetivoGetPostDisciplinaModel]) -> [(String, [ObjetivoGetPostDisciplinaModel])] {
        let agrupado = Dictionary(grouping: objetivos, by: { $0.competencia })
        return agrupado.sorted(by: { $0.key < $1.key })
    }
}
