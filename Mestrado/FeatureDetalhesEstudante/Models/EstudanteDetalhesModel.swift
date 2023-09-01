//
//  EstudanteDetalhesModel.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import Foundation

/// Conjunto dos dados utilizados na Tela de Detalhes do Estudante, utilizada pelo Professor.
struct EstudanteDetalhesModel: Codable {
    /// Objetivos fora do nível esperado do Estudante.
    var objetivosForaNivelEsperado: [ObjetivoForaNivelModel]
    
    /// Objetivos não avaliados pelo Estudante.
    var objetivosNaoAvaliados: [ObjetivoNaoAvaliadoModel]
    
    /// Dados dos Momentos Avaliativos utilizados nessa feature.
    var momentosAvaliativos: [MomentoAvaliativoTituloModel]
    
    /// Dados das Reflexões utilizadas nessa feature.
    var reflexoes: [ReflexaoEstudanteInfoModel]
    
    /// Dados dos Objetivos de Aprendizado utilizados nessa feature.
    var objetivos: [ObjetivoEstudanteInfoModel]
}
