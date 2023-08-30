//
//  PostAutoavaliacaoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 30/08/23.
//

/// Conjunto dos dados utilizados para criar uma nova Autoavaliação.
struct PostAutoavaliacaoModel: Codable {
    
    /// Identificador único do Estudante.
    var estudanteID: String
    
    /// Identificador único do Momento Avaliativo selecionado.
    var momentoAvaliativoID: String
    
    /// Data em que a Autoavaliação está ocorrendo.
    var data: String
    
    /// O sentimento selecionado pelo Estudante em relação ao Momento Avaliativo.
    var sentimento: Sentimento
    
    /// A descrição que representa a reflexão textual feita pelo Estudante.
    var descricao: String
    
    /// Os objetivos avaliados na Autoavaliação.
    var objetivosAvaliados: [PostObjetivoModel]
}
