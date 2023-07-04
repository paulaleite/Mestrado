//
//  APIService.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Implementação do protocolo APIServiceProtocol.
struct APIServico: APIServicoProtocol {
    
    /// Essa função pega do servidor, um Estudante específico, de acordo com seu ID.
    /// - Parameter id: a String do ID do Estudante.
    /// - returns: um Estudante.
    internal func getEstudantePorID(estudante id: String) async throws -> Estudante {
        let URLString: String = .getEstudante + "\(id)"
        
        guard let url = URL(string: URLString) else {
            throw APIErro.URLInvalida
        }
        
        let (dado, resposta) = try await URLSession.shared.data(from: url)
        
        guard let resposta = resposta as? HTTPURLResponse, resposta.statusCode == 200 else {
            throw APIErro.respostaInvalida
        }
        
        do {
            let decodificador = JSONDecoder()
            decodificador.keyDecodingStrategy = .convertFromSnakeCase
            return try decodificador.decode(Estudante.self, from: dado)
        } catch {
            throw APIErro.dadoInvalido
        }
    }
}

/// Enumerador que representa os Erros potenciais da consulta de API.
enum APIErro: Error {
    case URLInvalida
    case respostaInvalida
    case dadoInvalido
}
