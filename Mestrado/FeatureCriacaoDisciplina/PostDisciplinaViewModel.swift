//
//  PostDisciplinaViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Classe que possibilita a manipulação dos dados da Tela de Criação de uma disicipflina, que busca dados do servidor para popular a visualização, bem como salva as informações escolhidas pelo Professor.
class PostDisciplinaViewModel: ObservableObject {
    // MARK: - Variáveis e Constantes
    /// Source of Truth do título da Disciplina.
    @Published var titulo: String = ""
    
    /// Source of Truth dos Momentos Avaliativos criados.
    @Published var momentoAvaliativo: [MomentoAvaliativoPostDisciplinaModel] = []
    
    /// Source of Truth dos estudantes que fazem parte da Disciplina
    @Published var estudantes: [EstudantePostDisciplinaModel] = []
    
    /// Source of Truth dos Objetivos de Aprendizado existentes.
    @Published var objetivosDeAprendizadoDisponiveis: [ObjetivoGetPostDisciplinaModel] = []

    /// Source of Truth dos Estudantes disponíveis.
    @Published var estudantesDisponiveis: [EstudanteGetPostDisciplinaModel] = []
    
    /// Source of Truth de se os dados que estão sendo buscados no Servidor.
    @Published var estaBuscando: Bool = false
    
    /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
    @Published var mensagemDeErro: String? = nil
    
    /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
    let servico: APIServicoProtocol
    
    // MARK: - Inicializadores
    init(servico: APIServicoProtocol = APIServico()) {
        self.servico = servico
    }
    
    // MARK: - Funções
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Criação de uma Disciplina, consultada pelo Professor.
    @MainActor internal func getDadosCriacaoDisciplina() async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDadosCriacaoDisciplina()
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.objetivosDeAprendizadoDisponiveis = resultado.0!.objetivos
            self.estudantesDisponiveis = resultado.0!.estudantes
        }
        self.estaBuscando = false
    }
    
    /// Essa função envia os dados da Disciplina para o servidor.
    /// - Parameter dados: Dados do objetivo
    @MainActor internal func postDadosCriacaoDisciplina(dados: PostDisciplinaModel) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.postDadosCriacaoDisciplina(dados: dados)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            print(resultado.0!)
        }
    }
}
