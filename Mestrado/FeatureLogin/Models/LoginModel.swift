//
//  LoginModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

/// Entidade para envio das informações do login
struct LoginModel: Codable {
    /// Identificador único
    var id: String
    
    /// Senha da Pessoa
    var senha: String
    
    /// Identificador do Tipo da Pessoa, podendo ser Professor ou Estudante
    var tipo: String
    
    var disciplinas: [DisciplinaTituloModel]
}
