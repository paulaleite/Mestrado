//
//  ObjetivoEstudanteCriacaoAutoavaliacaoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

/// Objetivo de Aprendizado necessário para construir a tela de Criação de uma Autoavaliação, pelo Estudante.
struct ObjetivoAutoavaliacaoModel: Codable, Hashable {
    
    /// Identificador único da Entidade.
    var id: String
    
    /// Descrição detalhada do Objetivo de Aprendizado.
    var descricao: String
    
    /// Cor da Competência em que o Objetivo de Aprendizado se encontra.
    var corCompetencia: String
    
    /// Nível selecionado pelo Estudante nesse Objetivo de Aprendizado.
    var rubricaSelecionada: Rubrica
}

