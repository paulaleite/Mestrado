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
    
    /// Essa função busca do servidor, os dados para a criação Tela de Informações do Estudante, permitindo que ele visualize informações sobre o seu estado na disciplina.
    /// - Parameter estudanteID: String do ID do Estudante.
    /// - Parameter disciplinaID: String do ID da Disciplina.
    /// - returns: dados do Modelo das Informações do Estudante.
    internal func getDadosInfoEstudante(estudanteID: String, disciplinaID: String) async -> (EstudanteInfoModel?, APIErro?) {
//        let stringURL: String = .getGraficoEstudante + "\(estudanteID)" + "\(disciplinaID)"
        
        if let stringPath = Bundle.main.path(forResource: "getAutoavaliacoesEstudante", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: EstudanteInfoModel.self), nil)
            } catch (let e) {
                if let err = e as? APIErro {
                    return (nil, err)
                }
            }
        }
    
        return (nil, APIErro.URLInvalida)
    }
    
    /// Essa função busca do servidor, os dados para necessários para construir a Feature de Criação de uma Autoavaliação..
    /// - Parameter estudanteID: String do ID do Estudante.
    /// - Parameter disciplinaID: String do ID da Disciplina.
    /// - returns: dados do Modelo de Criação de uma Autoavaliação.
    internal func getDadosAutoavaliacao(estudanteID: String, disciplinaID: String) async -> (AutoavaliacaoModel?, APIErro?) {
        if let stringPath = Bundle.main.path(forResource: "getAutoavaliacao", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: AutoavaliacaoModel.self), nil)
            } catch(let e) {
                if let erro = e as? APIErro {
                    return (nil, erro)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    internal func postDadosAutoavaliacao(dados: PostAutoavaliacaoModel) async throws -> PostAutoavaliacaoModel {
        return PostAutoavaliacaoModel(estudanteID: "", momentoAvaliativoID: "", data: "", sentimento: .amei, descricao: "", objetivosAvaliados: [PostObjetivoModel(objetivoID: "", rubricaSelecionada: .muitoInsatisfeito)])
//        let autoAvaliacaoInfo: [String: Any] = [
//            "estudanteID": dados.estudanteID,
//            "momentoAvaliativoID": dados.momentoAvaliativoID,
//            "data": dados.data,
//            "sentimento": dados.sentimento,
//            "descricao": dados.descricao,
//            "objetivosAvaliados": dados.objetivosAvaliados
//        ]
//
//
    }
}

