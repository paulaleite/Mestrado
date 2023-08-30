//
//  CriacaoAutoavaliacaoViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados da Tela de Criação de uma Autoavaliação, permitindo que ele informe a data, reflexão e o nível nos objetivos. Também possibilita o acesso das informações.
@MainActor class AutoavaliacaoViewModel: ObservableObject {
    
    // MARK: - Variávies e Constantes
    
    /// Source of Truth dos momentos avaliativos do Estudante, dentro da Disciplina.
    @Published var momentos: [MomentoAvaliativoTituloModel] = []
    
    /// Source of Truth dos objetivos de aprendizado de um Momento Avaliativo.
    @Published var objetivos: [ObjetivoAutoavaliacaoModel] = []
    
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
        
        getDadosCriacaoAutoavaliacao(estudanteID: estudanteID, disciplinaID: disciplinaID)
    }
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Criação de uma Autoavaliação.
    /// Para isso, serão buscadas as informações dos Momento Avaliativos de uma Disciplina, bem como os Objetivos de Aprendizado associados a elas.
    /// - Parameter estudanteID: a String que possui o ID do Estudante.
    /// - Parameter disciplinaID: a String que possui o ID da Disciplina.
    internal func getDadosCriacaoAutoavaliacao(estudanteID: String, disciplinaID: String) {
        estaBuscando = true
        mensagemDeErro = nil
        
        Task {
            do {
                let dados = try await servico.getDadosAutoavaliacao(estudanteID: estudanteID, disciplinaID: disciplinaID)
                self.momentos = dados.momentos
                self.objetivos = dados.objetivos
            } catch(let erro) {
                self.mensagemDeErro = erro.localizedDescription
            }
            self.estaBuscando = false
        }
    }
}
