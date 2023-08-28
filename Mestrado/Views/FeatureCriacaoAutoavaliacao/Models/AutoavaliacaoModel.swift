//
//  CriacaoAutoavaliacaoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import Foundation

/// Conjunto dos dados utilizados na Feature de Criação de uma Autoavaliação.
struct AutoavaliacaoModel: Codable, Hashable {
    
    /// Dados dos Momentos Avaliativos dessa Disciplina.
    var momentos: [MomentoAvaliativoTituloModel]
    
    /// Dados dos Objetivos de Aprendizado utilizados nessa feature.
    var objetivos: [ObjetivoAutoavaliacaoModel]
}
