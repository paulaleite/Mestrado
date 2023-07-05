//
//  APIErro.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Enumerador que representa os Erros potenciais da consulta de API.
enum APIErro: Error {
    /// Caso em que a URL não é válida.
    case URLInvalida
    
    /// Caso em que a resposta que a consulta retornou, não é válida.
    case respostaInvalida
    
    /// Caso em que os dados decodificados de JSON, para o formato esperado, não são válidos.
    case dadoInvalido
    
    var descricao: String {
        switch self {
        case .URLInvalida:
            return "Descricao.Erro.URLInvalida".localized()
        case .dadoInvalido:
            return "Descricao.Erro.RespostaInvalida".localized()
        case .respostaInvalida:
            return "Descricao.Erro.DadoInvalido".localized()
        }
    }
}
