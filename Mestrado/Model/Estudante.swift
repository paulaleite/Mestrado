//
//  Usuario.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Entidade do Estudante.
struct Estudante: Codable, Identifiable {
    
    /// Identificador único do Estudante.
    var id: String
    
    /// Número de identificação único do Estudante, fornecido pela Universidade.
    let numeroDeIdentificacao: Double?
    
    /// Nome do Estudante.
    let nome: String
    
    /// As autoavaliações que um Estudante já realizou.
    var autoavaliacoes: [AutoAvaliacao]
}
