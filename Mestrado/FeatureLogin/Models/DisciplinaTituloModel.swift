//
//  DisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

/// Entidade que representa o Título da Disciplina da Pessoa.
struct DisciplinaTituloModel: Codable, Hashable {
    /// Identificador único
    var id: String
    
    /// Título da Disciplina
    var titulo: String
}
