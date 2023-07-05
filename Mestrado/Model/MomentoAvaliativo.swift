//
//  MomentoAvaliativo.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade do Momento Avaliativo.
struct MomentoAvaliativo: Codable, Identifiable {
    
    /// Identificador único do Momento Avaliativo.
    var id: String
    
    /// Título descritivo do Momento Avaliativo.
    var titulo: String
    
    /// Data em que o Momento Avaliativo ocorrerá.
    var data: Date
    
    /// Lista de Objetivos de Aprendizado que serão analisados durante essa etapa.
    var objetivosDeAprendizado: [ObjetivoDeAprendizado]
}
