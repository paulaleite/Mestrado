//
//  MomentoAvaliativoPostDisciplinaModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import Foundation

/// Estrutura que representa o Momento Avaliativo que será determinado pelo Professor.
struct MomentoAvaliativoPostDisciplinaModel: Codable {
    /// Título do Momento Avaliativo.
    var titulo: String
    
    /// Data do Momento Avaliativo.
    var data: String
    
    /// Objetivos de Aprendizado
    var objetivos: [ObjetivosPostDisciplinaModel]
}
