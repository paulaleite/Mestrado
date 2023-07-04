//
//  Sentiment.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation

/**
 Entidade dos Sentimentos dos Estudantes em relação a um Momento Avaliativo. São representados por emojis, os quais, com o uso de um Enum, são associados a palavras.
 */
enum Sentimento: String, Codable {
    /// O sentimento de ter amado muito o momento avaliativo, representado pelo emoji 😄.
    case amei = "Amei"
    
    /// O sentimento de ter gostado do momento avaliativo, representado pelo emoji 🙂.
    case gostei = "Gostei"
    
    /// O sentimento indiferente em relação ao momento avaliativo, representado pelo emoji 😐.
    case indiferente = "Indiferente"
    
    /// O sentimento de não ter gostado do momento avaliativo, representado pelo emoji 😖.
    case naoGostei = "Não Gostei"
    
    /// O sentimento de ter odiado o momento avaliativo, representado pelo emoji 😩.
    case odiei = "Odiei"
    
    var description: String {
        switch self {
            case .amei:
                return "amei".localized()
            case .gostei:
                return "gostei".localized()
            case .indiferente:
                return "indiferente".localized()
            case .naoGostei:
                return "naoGostei".localized()
            case .odiei:
                return "odiei".localized()
        }
    }
}
