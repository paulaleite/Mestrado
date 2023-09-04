//
//  APIServiceProtocol.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Protocolo que junta todas as funções que compõem o Serviço da API.
protocol APIServicoProtocol {
    
    func dadoDecodificado<T: Decodable>(dado: Data, tipo: T.Type) throws -> T
    
    func getDado(stringURL: String) async throws -> Data
    
    func getDadoDecodificado<T: Decodable>(stringURL: String, tipo: T.Type) async throws -> T
    
    // MARK: - Features
    
    func getPessoaPeloID(pessoaID: String, senha: String, tipo: String) async -> (LoginModel?, APIErro?)
    func getDisciplinasDaPessoa(pessoaID: String, senha: String, tipo: String) async -> ([DisciplinaTituloModel]?, APIErro?)
    
    func getDadosInfoEstudante(estudanteID: String, disciplinaID: String) async -> (EstudanteInfoModel?, APIErro?)
    
    func getDadosAutoavaliacao(estudanteID: String, disciplinaID: String) async -> (AutoavaliacaoModel?, APIErro?)
    
    func getDadosInfoProfessor(disciplinaID: String) async -> (ProfessorInfoModel?, APIErro?)
    
    func getDadosDetalhesEstudante(estudanteID: String, disciplinaID: String) async -> (EstudanteDetalhesModel?, APIErro?)
    
    func postDadosAutoavaliacao(dados: PostAutoavaliacaoModel, disciplinaID: String) async -> (PostAutoavaliacaoModel?, APIErro?)
}
