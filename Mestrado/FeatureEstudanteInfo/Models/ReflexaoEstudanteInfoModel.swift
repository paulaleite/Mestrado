//
//  ReflexaoEstudanteInfo.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import Foundation

/// Reflexões que o Estudante já realizou em uma determinada Disciplina.
struct ReflexaoEstudanteInfoModel: Codable, Hashable {
    
    /// O Sentimento que o Estudante selecionou em relação ao Momento Avaliativo.
    var sentimento: Sentimento
    
    /// A data em que o Estudante realizou a Reflexão.
    var data: String
    
    /// A reflexão textual que o Estudante fez.
    var descricao: String
    
    /// Nome do Momento Avaliativo em que essa Reflexão aconteceu.
    var momentoAvaliativo: String
}
