//
//  ProfessorFetcher.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados do Professor, possibilitando acesso a todos os professores de uma disciplina, ou apenas ao professor que está acessando o sistema.
class ProfessorFetcher: ObservableObject {
    
    // MARK: Variáveis e Constantes
    
    /// Source of Truth do Professor que está acessando o sistema.
    @Published var professor: Professor?
    
    /// Source of Truth de todos os Professores.
    @Published var professores: [Professor]?
    
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
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, um Professor específico, de acordo com seu ID.
    /// - Parameter id: a String que possui o ID do Professor.
    internal func getProfessorPorID(professor id: String) {
        estaBuscando = true
        mensagemDeErro = nil
        
        Task {
            do {
                professor = try await servico.getProfessorPorID(professor: id)
            } catch APIErro.URLInvalida {
                mensagemDeErro = APIErro.URLInvalida.descricao
            } catch APIErro.dadoInvalido {
                mensagemDeErro = APIErro.dadoInvalido.descricao
            } catch APIErro.respostaInvalida {
                mensagemDeErro = APIErro.respostaInvalida.descricao
            }
        }
    }
}
