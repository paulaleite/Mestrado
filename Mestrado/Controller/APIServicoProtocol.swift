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
    
    // MARK: - Feature Estudante Informações
    
    func getDadosInfoEstudante(estudanteID: String, disciplinaID: String) async throws -> InfoEstudanteModel
    
    // MARK: - Outros
    
    func getEstudantePorID(estudante id: String) async throws -> Estudante
    
    func getProfessorPorID(professor id: String) async throws -> Professor
}
