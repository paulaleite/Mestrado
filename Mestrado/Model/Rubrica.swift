//
//  Rubrica.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Entidade das Rubricas Avaliativas, as quais são configuradas durante Momentos Avaliativos.
enum Rubrica: Int, Codable {
    /// A rubrica quando o estudante não estudou um objetivo de aprendizado.
    case naoEstudado = 0
    
    /// A rubrica quando o estudante está muito satifeito com o objetivo de aprendizado.
    case muitoSatisfeito = 5
    
    /// A rubrica quando o estudante está parcialmente satisfeito com o objetivo de aprendizado.
    case parcialmenteSatisfeito = 4
    
    /// A rubrica quando o estudante não está nem satisfeito ou insatisfeito com o objetivo de aprendizado.
    case nemSatisfeitoNemInsatisfeito = 3
    
    /// A rubrica quando o estudante está parcilamente satisfeito com o objetivo de aprendizado.
    case parcialmenteInsatisfeito = 2
    
    /// A rubrica quando o estudante está muito satisfeito com o objetivo de aprendizado.
    case muitoInsatisfeito = 1
    
    
    
    /// Representa o título da rubrica configurada pelo estudante.
    var titulo: String {
        switch self {
            case .naoEstudado:
                return "Titulo.Rubricas.NãoEstudado".localized()
            case .muitoSatisfeito:
                return "Titulo.Rubricas.MuitoSatisfeito".localized()
            case .parcialmenteSatisfeito:
                return "Titulo.Rubricas.ParcialmenteSatisfeito".localized()
            case .nemSatisfeitoNemInsatisfeito:
                return "Titulo.Rubricas.NemSatisfeitoNemInsatisfeito".localized()
            case .parcialmenteInsatisfeito:
                return "Titulo.Rubricas.ParcialmenteInsatisfeito".localized()
            case .muitoInsatisfeito:
                return "Titulo.Rubricas.MuitoInsatisfeito".localized()
        }
    }
}
