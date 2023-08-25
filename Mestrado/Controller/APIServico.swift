//
//  APIService.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Implementação do protocolo APIServiceProtocol.
struct APIServico: APIServicoProtocol {
    
    let decoder: JSONDecoder = .init()
    
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
            return try decodificador.decode(Estudante.self, from: dado)
        } catch {
            throw APIErro.dadoInvalido
        }
    }
    
    /// Essa função pega do servidor, um Professor específico, de acordo com seu ID.
    /// - Parameter id: a String do ID do Professor.
    /// - returns: um Professor.
    func getProfessorPorID(professor id: String) async throws -> Professor {
        let URLString: String = .getProfessor + "\(id)"
        return try await getDecodedData(stringUrl: URLString, type: Professor.self)
    }
    
    func getDecodedData<T: Decodable>(stringUrl: String, type: T.Type) async throws -> T {
        let dado = try await getData(stringUrl: stringUrl)
        return try decodeData(data: dado, type: T.self)
    }
    
    func decodeData<T: Decodable>(data: Data, type: T.Type) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
    
    func getData(stringUrl: String) async throws -> Data {
        let url = URL(filePath: stringUrl)  // else { throw NSError() }
        let (dado, resposta) = try await URLSession.shared.data(from: url)
        
        
        guard let resposta = resposta as? HTTPURLResponse, resposta.statusCode == 200 else {
            throw APIErro.respostaInvalida
        }
        
        return dado
    }
    
    func getTodosObjetivosPorID() async throws -> [ObjetivoDeAprendizado] {
        let URLString: String = .getObjetivos
        
        guard let url = URL(string: URLString) else {
            throw APIErro.URLInvalida
        }
        
        let (dado, resposta) = try await URLSession.shared.data(from: url)
        
        guard let resposta = resposta as? HTTPURLResponse, resposta.statusCode == 200 else {
            throw APIErro.respostaInvalida
        }
        
        do {
            let decodificador = JSONDecoder()
            return try decodificador.decode([ObjetivoDeAprendizado].self, from: dado)
        } catch {
            throw APIErro.dadoInvalido
        }
    }
}

