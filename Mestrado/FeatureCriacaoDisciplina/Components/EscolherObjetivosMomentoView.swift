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
    
    /// Texto da busca que vai ser atualizado sempre que o usuário mudá-lo.
    @State var textoBusca: String = ""
    
    /// Momento Avaliativo selecionado.
    var momento: MomentoAvaliativoPostDisciplinaModel
    
    var resultadoBusca: [ObjetivoGetPostDisciplinaModel] {
        if textoBusca.isEmpty {
            return viewModel.objetivosDeAprendizadoDisponiveis
        } else {
            return viewModel.objetivosDeAprendizadoDisponiveis.filter {
                $0.descricao.contains(textoBusca)
            }
        }
    }
    
    var objetivoSelecionado: Bool {
        var resultado: Bool = false
        
        for par in agruparPorCategoria(resultadoBusca) {
            for obj in par.1 {
                for objetivo in momento.objetivos {
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
                    EscolherObjetivosMomentoSectionView(momento: momento, par: par)
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

/// Visualização da Seção dos Objetivos, categorizados pela Competência.
struct EscolherObjetivosMomentoSectionView: View {
    /// Momento Avaliativo selecionado.
    var momento: MomentoAvaliativoPostDisciplinaModel
    
    /// Objetivo de Aprendizado selecionado
    var par: (String, [ObjetivoGetPostDisciplinaModel])
    
    /// Descrição da data convertida para Date.
    var data: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        guard let dataUnwrapped = dateFormatter.date(from: momento.data) else {
            return .now
        }
        return dataUnwrapped
    }
    
    var body: some View {
        Section {
            ForEach(par.1, id: \.self) { obj in
                if momento.objetivos.contains(where: { $0.id == obj.id }) {
                    ObjetivoSelecionadoDisciplinaCellView(tituloMomento: momento.titulo, data: data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(obj.corCompetencia), descricao: obj.descricao, objetivoID: obj.id), selecao: true, mostrarPicker: false)
                } else {
                    ObjetivoSelecionadoDisciplinaCellView(tituloMomento: momento.titulo, data: data, dto: ObjetivoSelecionadoCellDTO(corCompetencia: Color(obj.corCompetencia), descricao: obj.descricao, objetivoID: obj.id), selecao: false, mostrarPicker: false)
                }
            }
        } header: {
            Text(par.0)
                .font(.system(size: 11))
                .foregroundColor(Color.texto2)
        }
    }
}
