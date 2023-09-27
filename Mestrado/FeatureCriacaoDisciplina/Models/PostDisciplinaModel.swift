//
//  PostDisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import Foundation

/// Entidade que representa a Disciplina que está sendo construída pelo Professor.
struct PostDisciplinaModel: Codable {
    /// Título da Disciplina
    var titulo: String
    
    /// Momentos Avaliativos determinados
    var momentoAvaliativo: [MomentoAvaliativoPostDisciplinaModel]
    
    /// Estudantes que participarão da Disciplina
    var estudantes: [EstudantePostDisciplinaModel]
}
