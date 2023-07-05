//
//  APIServiceProtocol.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Protocolo que junta todas as funções que compõem o Serviço da API.
protocol APIServicoProtocol {
    func getEstudantePorID(estudante id: String) async throws -> Estudante
    
    func getProfessorPorID(professor id: String) async throws -> Professor
}
