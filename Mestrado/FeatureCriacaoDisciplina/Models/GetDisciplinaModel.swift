//
//  GetDisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import Foundation

/// Entidade que representa os dados necessários para estruturar a Tela de Criação de Disciplinas.
struct GetDisciplinaModel: Codable {
    /// Todos os objetivos de aprendizado disponíveis.
    var objetivos: [ObjetivoGetPostDisciplinaModel]
    
    /// Todos os estudantes disponíveis.
    var estudantes: [EstudanteGetPostDisciplinaModel]
}
