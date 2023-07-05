//
//  ObjetivoDeAprendizadoAvaliado.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade que representa o Objetivo de Aprendizado no seu estado Avaliado.
/// Isso foi necessário para que sempre houvesse a relação entre a Rubrica e o Objetivo de Aprendizado.
struct ObjetivoDeAprendizadoAvaliado: Codable, Identifiable {
    
    /// Identificador único do Objetivo de Aprendizado Avaliado.
    var id: String
    
    /// O Objetivo de Aprendizado  que está sendo avaliado.
    var objetivoDeAprendizado: ObjetivoDeAprendizado
    
    /// A Rubrica escolhida para o Objetivo de Aprendizado em avaliação.
    var rubricaSelecionada: Rubrica
}
