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
    
    var resultadoBusca: [ObjetivoGetPostDisciplinaModel] {
        if textoBusca.isEmpty {
            return viewModel.objetivosDeAprendizadoDisponiveis
        } else {
            return viewModel.objetivosDeAprendizadoDisponiveis.filter {
                $0.descricao.contains(textoBusca)
            }
        }
    }
    
    // MARK: - Body da View
    var body: some View {
        List {
            ForEach(agruparPorCategoria(viewModel.objetivosDeAprendizadoDisponiveis), id: \.0) { par in
                Section {
                    ForEach(par.1, id: \.self) { obj in
                        Text(obj.descricao)
                    }
                } header: {
                    Text(par.0)
                        .font(.system(size: 11))
                        .foregroundColor(Color.texto2)
                }
            }
        }
        .searchable(text: $textoBusca)
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
