//
//  ObjetivoGetPostDisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import Foundation

/// Entidade que representa o Objetivo de Aprendizado, que será utilizado para estruturar a Tela de Criação de Disciplinas.
struct ObjetivoGetPostDisciplinaModel: Codable {
    /// Identificador único
    var id: String
    
    /// Descrição do Objetivo
    var descricao: String
    
    /// Cor da Competência
    var corCompetencia: String
    
    /// Título da Competência
    var competencia: String
}
