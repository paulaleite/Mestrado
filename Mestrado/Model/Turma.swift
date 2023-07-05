//
//  Turma.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade da Turma.
struct Turma: Codable, Identifiable {
    
    /// Identificador único da Turma.
    var id: String
    
    /// Título descritivo da Turma.
    var titulo: String
    
    /// Lista de Estudantes que fazem parte da turma, informação previamente disponibilizada pelo servidor.
    var estudantes: [Estudante]
}
