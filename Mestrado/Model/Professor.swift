//
//  Professor.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade do Professor.
struct Professor: Codable, Identifiable {
    
    /// Identificador único do Professor.
    var id: String
    
    /// Número de identificação único do Professor, fornecido pela Universidade.
    let numeroDeIdentificacao: Double?
    
    /// Nome do Professor.
    let nome: String
    
    /// Lista de Disciplinas que o Professor ministra.
    var disciplinas: [Disciplina]
}
