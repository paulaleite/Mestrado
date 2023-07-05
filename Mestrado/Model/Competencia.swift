//
//  Competencia.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade da Competência.
struct Competencia: Codable, Identifiable {
    
    /// Identificador único da Competência.
    var id: String
    
    /// Nome da Competência.
    var nome: String
    
    /// Nome da Cor da Competência.
    var nomeCor: String
    
    /// Objetivos de Aprendizado que pertencem a essa Competência.
    var objetivosDeAprendizado: [ObjetivoDeAprendizado]
}
