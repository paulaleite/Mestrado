//
//  PostObjetivoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 30/08/23.
//

/// Conjunto de dados que representam um Objetivo de Aprendizado avaliado pelo Estudante.
struct PostObjetivoModel: Codable {
    
    /// Identificador único do Objetivo de Aprendizado.
    var objetivoID: String
    
    /// Rubrica selecionada pelo Estudante em relação ao Objetivo de Aprendizado.
    var rubricaSelecionada: Rubrica
}
