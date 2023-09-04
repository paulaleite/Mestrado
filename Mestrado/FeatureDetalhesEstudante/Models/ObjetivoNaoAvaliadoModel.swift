//
//  ObjetivoNaoAvaliadoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import Foundation

/// Entidades dos Objetivos de Aprendizado não avaliados pelo Estudante.
struct ObjetivoNaoAvaliadoModel: Codable, Hashable {
    /// Título da cor da Competência
    var corDaCompetencia: String
    
    /// Descrição do Objetivo de Aprendizado
    var descricao: String
}
