//
//  EstudanteDetalhesViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados da Tela de Informações do Estudante, que permite que o Professor compreenda maiores detalhes sobre o Estudante.
class EstudanteDetalhesViewModel: ObservableObject {
    // MARK: - Variávies e Constantes
    
    /// Source of Truth dos dados do Gráfico do Professor.
    @Published var objetivosForaDoNivelEsperado: [ObjetivoForaNivelModel] = []
    
    /// Source of Truth  de todos os estudantes, em uma Disciplina.
    @Published var objetivosNaoAvaliados: [ObjetivoNaoAvaliadoModel] = []
    
    /// Source of Truth dos momentos avaliativos do Estudante, dentro da Disciplina.
    @Published var momentosAvaliativos: [MomentoAvaliativoTituloModel] = []
    
    /// Source of Truth das reflexões do Estudante, dentro da Disciplina.
    @Published var reflexoes: [ReflexaoEstudanteInfoModel] = []
    
    /// Source of Truth dos objetivos do Estudante, dentro da Disciplina.
    @Published var objetivos: [ObjetivoEstudanteInfoModel] = []
    
    /// Source of Truth de se os dados que estão sendo buscados no Servidor.
    @Published var estaBuscando: Bool = false
    
    /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
    @Published var mensagemDeErro: String? = nil
    
    /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
    let servico: APIServicoProtocol
    
    /// Variável que representa a String com o Identificador Único do Estudante.
    var estudanteID: String = ""
    /// Variável que representa a String com o Identificador Único da Disciplina.
    var disciplinaID: String = ""
    
    // MARK: - Inicializadores
    init(servico: APIServicoProtocol = APIServico()) {
        self.servico = servico
    }
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Informações do Estudante, consultada pelo Professor.
    /// - Parameter estudanteID: String que possui o ID do Estudante.
    /// - Parameter disciplinaID: a String que possui o ID da Disciplina.
    @MainActor internal func getDadosDetalhesEstudante(estudanteID: String, disciplinaID: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDadosDetalhesEstudante(estudanteID: estudanteID, disciplinaID: disciplinaID)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.objetivosForaDoNivelEsperado = resultado.0!.objetivosForaDoNivelEsperado
            self.objetivosNaoAvaliados = resultado.0!.objetivosNaoAvaliados
            self.momentosAvaliativos = resultado.0!.momentosAvaliativos
            self.reflexoes = resultado.0!.reflexoes
            self.objetivos = resultado.0!.objetivos
        }
        self.estaBuscando = false
    }
}
