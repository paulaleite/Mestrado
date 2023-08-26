//
//  APIService.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Implementação do protocolo APIServiceProtocol.
struct APIServico: APIServicoProtocol {
    
    let decodificador: JSONDecoder = JSONDecoder()
    
    /// Essa função decodifica um dado do tipo Data para um tipo T.
    /// - Parameter dado: dado no formato de Data.
    /// - Parameter tipo: tipo do dado desejado.
    /// - returns: tipo de dado T.
    func dadoDecodificado<T: Decodable>(dado: Data, tipo: T.Type) throws -> T {
        return try decodificador.decode(T.self, from: dado)
    }
    
    /// Essa função busca adquiri o Data a partir de uma URL contendo um JSON.
    /// - Parameter stringURL: URL do JSON desejado.
    /// - returns: dado adqurido pelo JSON da URL.
    func getDado(stringURL: String) async throws -> Data {
        let url = URL(filePath: stringURL)  // else { throw NSError() }
//        let (dado, resposta) = try await URLSession.shared.data(from: url)
        let (dado, _) = try await URLSession.shared.data(from: url)
        
        
//        guard let resposta = resposta as? HTTPURLResponse, resposta.statusCode == 200 else {
//            throw APIErro.respostaInvalida
//        }
        
        return dado
    }
    
    /// Função que busca o Data a partir de uma URL que contém um JSON. Em seguida, decodifica o dado para o tipo desejado.
    /// - Parameter stringURL: URL do JSON desejado.
    /// - Parameter tipo: tipo do dado desejado.
    /// - returns: dados no formato do tipo T.
    func getDadoDecodificado<T: Decodable>(stringURL: String, tipo: T.Type) async throws -> T {
        let dado = try await getDado(stringURL: stringURL)
        return try dadoDecodificado(dado: dado, tipo: T.self)
    }
    
    /// Essa função busca do servidor, os dados para dos momentos avaliativos de um estudante, dentro de uma disciplina específica.
    /// - Parameter estudanteID: String do ID do Estudante.
    /// - Parameter disciplinaID: String do ID da Disciplina.
    /// - returns: dados dos momentos avaliativos.
    internal func getDadosInfoEstudante(estudanteID: String, disciplinaID: String) async throws -> EstudanteInfoModel {
//        let stringURL: String = .getGraficoEstudante + "\(estudanteID)" + "\(disciplinaID)"
        if let stringPath = Bundle.main.path(forResource: "getAutoavaliacoesEstudante", ofType: "json") {
            return try await getDadoDecodificado(stringURL: stringPath, tipo: EstudanteInfoModel.self)
        }
        
        return EstudanteInfoModel(qtdObjsPorCompetencia: [], momentosAvaliativos: [], reflexoes: [], objetivos: [])
    }
    
    /// Essa função pega do servidor, um Estudante específico, de acordo com seu ID.
    /// - Parameter id: a String do ID do Estudante.
    /// - returns: um Estudante.
    internal func getEstudantePorID(estudante id: String) async throws -> Estudante {
        let stringURL: String = .getEstudante + "\(id)"
        return try await getDadoDecodificado(stringURL: stringURL, tipo: Estudante.self)
    }
    
    /// Essa função pega do servidor, um Professor específico, de acordo com seu ID.
    /// - Parameter id: a String do ID do Professor.
    /// - returns: um Professor.
    func getProfessorPorID(professor id: String) async throws -> Professor {
        let stringURL: String = .getProfessor + "\(id)"
        return try await getDadoDecodificado(stringURL: stringURL, tipo: Professor.self)
    }
}

