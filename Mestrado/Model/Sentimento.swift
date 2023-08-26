//
//  Sentiment.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation

/// Entidade dos Sentimentos dos Estudantes em relação a um Momento Avaliativo.
///
/// São representados por emojis, os quais, com o uso de um Enum, são associados a palavras.
enum Sentimento: Int, Codable {
    /// O sentimento de ter amado muito o momento avaliativo, representado pelo emoji 😄.
    case amei = 4
    
    /// O sentimento de ter gostado do momento avaliativo, representado pelo emoji 🙂.
    case gostei = 3
    
    /// O sentimento indiferente em relação ao momento avaliativo, representado pelo emoji 😐.
    case indiferente = 2
    
    /// O sentimento de não ter gostado do momento avaliativo, representado pelo emoji 😖.
    case naoGostei = 1
    
    /// O sentimento de ter odiado o momento avaliativo, representado pelo emoji 😩.
    case odiei = 0
    
    /// Especificação do emoji referente a cada sentimento.
    var description: String {
        switch self {
            case .amei:
                return "Descricao.Sentimentos.Amei".localized()
            case .gostei:
                return "Descricao.Sentimentos.Gostei".localized()
            case .indiferente:
                return "Descricao.Sentimentos.Indiferente".localized()
            case .naoGostei:
                return "Descricao.Sentimentos.NaoGostei".localized()
            case .odiei:
                return "Descricao.Sentimentos.Odiei".localized()
        }
    }
}
