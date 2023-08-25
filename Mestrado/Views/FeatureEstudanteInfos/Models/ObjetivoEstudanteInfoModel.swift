//
//  ObjetivoEstudanteInfo.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import Foundation

/// Objetivo de Aprendizado necessário para construir a tela de Informações do Estudane.
struct ObjetivoEstudanteInfoModel: Codable {
    
    /// Descrição detalhada do Objetivo de Aprendizado.
    var descricao: String
    
    /// Cor da Competência em que o Objetivo de Aprendizado se encontra.
    var corCompetencia: String
    
    /// Nome da Competência do Objetivo de Aprendizado.
    var nomeCompetencia: String
    
    /// Rubrica esperada para esse Objetivo de Aprendizado, determinada pelo Professor.
    var nivelEsperado: Rubrica
    
    /// Nível selecionado pelo Estudante nesse Objetivo de Aprendizado.
    var rubricaSelecionada: Rubrica
    
    /// Nome do Momento Avaliativo em que esse Objetivo de Aprendizado foi refletido.
    var momentoAvaliativo: String
}
