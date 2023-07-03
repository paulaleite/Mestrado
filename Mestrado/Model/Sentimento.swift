//
//  Sentiment.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation

enum Sentimento: String, Codable {
    case amei = "Amei"
    case gostei = "Gostei"
    case indiferente = "Indiferente"
    case naoGostei = "Não Gostei"
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
