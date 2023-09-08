//
//  EstudanteGetPostDisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import Foundation

/// Entidade que representa o Estudante, que será utilizado para construir a Tela de Criação de Disciplinas.
struct EstudanteGetPostDisciplinaModel: Codable, Hashable {
    /// Identificador único
    var id: String
    
    /// Nome do estudante
    var nome: String
    
    /// Número de Identificação da Universidade
    var numIdentificacao: Int
}
