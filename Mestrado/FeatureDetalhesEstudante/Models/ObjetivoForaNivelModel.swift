//
//  ObjetivoForaNivelModel.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import Foundation

/// Entidade dos Objetivos de Aprendizado do Estudante que estão fora do nível esperado
struct ObjetivoForaNivelModel: Codable, Hashable {
    /// Título da cor da Competência
    var corDaCompetencia: String
    
    /// Descrição do Objetivo de Aprendizado
    var descricao: String
    
    /// Nível esperado pelo Professor daquele Objetivo de Aprendizado
    var nivelEsperado: Rubrica
    
    /// Rubrica selecionada pelo Estudante no Objetivo de Aprendizado
    var rubricaSelecionada: Rubrica
}
