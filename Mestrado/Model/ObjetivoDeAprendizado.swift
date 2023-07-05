//
//  ObjetivoDeAprendizado.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade do Objetivo de Aprendizado.
struct ObjetivoDeAprendizado: Codable, Identifiable {
    
    /// Identificador único do Objetivo de Aprendizado.
    var id: String
    
    /// Descrição detalhada do Objetivo de Aprendizado.
    var descricao: String
    
    /// Rubrica esperada para esse objetivo de aprendizado, determinada pelo Professor.
    var nivelEsperado: Rubrica?
    
    /// Nome da Competência do Objetivo de Aprendizado.
    var nomeCompetencia: String?
    
    /// Cor da Competência em que o Objetivo de Aprendizado se encocntra.
    var corCompetencia: String?
}
