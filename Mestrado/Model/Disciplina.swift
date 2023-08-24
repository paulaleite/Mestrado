//
//  Disciplina.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade da Disciplina.
struct Disciplina: Codable, Identifiable {
    
    /// Identificador único da Disciplina.
    var id: String
    
    /// Título descritivo da Disciplina.
    var titulo: String
    
    /// Lista de Momentos Avaliativos que acontecerão durante a Disciplina.
    var momentosAvaliativos: [MomentoAvaliativo]
    
    /// Lista dos estudantes que participarão da Disciplina.
    var estudantes: [Estudante]
}
