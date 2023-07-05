//
//  EstudanteFetcher.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados do Estudante, possibilitando acesso a todos os estudantes de uma disciplina, ou apenas ao estudante que está acessando o sistema.
class EstudanteFetcher: ObservableObject {
    
    // MARK: Variáveis e Constantes
    
    /// Source of Truth do Estudante que está acessando o sistema.
    @Published var estudante: Estudante?
    
    /// Source of Truth de todos os Estudantes que participam de uma disciplina, utilizado pelo Professor.
    @Published var estudantes: [Estudante]?
    
    /// Source of Truth de se os dados estando sendo buscados no Servidor.
    @Published var estaBuscando: Bool = false
    
    /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
    @Published var mensagemDeErro: String? = nil
    
    /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
    let servico: APIServicoProtocol
    
    // MARK: Inicializadores
    
    /// Inicializador do EstudanteFetcher.
    /// - Parameter servico: Conexão com o serviço de acesso aos dados da API.
    init(servico: APIServicoProtocol = APIServico()) {
        self.servico = servico
    }
    
    // MARK: - Functions
    
    /// Essa função vai buscar no servidor, um Estudante específico, de acordo com seu ID.
    /// - Parameter id: a String que possui o ID do Estudante.
    internal func getUserByID(user id: String) {
        estaBuscando = true
        mensagemDeErro = nil
        
        Task {
            do {
                estudante = try await servico.getEstudantePorID(estudante: id)
            } catch APIErro.URLInvalida {
                mensagemDeErro = APIErro.URLInvalida.descricao
            }
        }
    }
}
