//
//  ObjetivosPostDisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import Foundation

/// Entidade que representa o Objetivo de Aprendizado que será utilizado para construir uma Disciplina, fazendo parte de Momentos Avaliativos.
struct ObjetivosPostDisciplinaModel: Codable {
    /// Identificador único
    var id: String
    
    /// Nível esperado no Objetivo de Aprendizado
    var nivelEsperado: Int
}
