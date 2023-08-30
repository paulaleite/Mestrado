//
//  InfoEstudanteModel.swift
//  Mestrado
//
//  Created by Paula Leite on 25/08/23.
//

import Foundation

/// Conjunto dos dados utilizados na Feature Estudante Informações.
struct EstudanteInfoModel: Codable {
    
    /// Dados dos Objetivos de Aprendizado agrupados por Competência.
    var qtdObjsPorCompetencia: [GraficoEstudanteInfoModel]
    
    /// Dados dos Momentos Avaliativos utilizados nessa feature.
    var momentosAvaliativos: [MomentoAvaliativoTituloModel]
    
    /// Dados das Reflexões utilizadas nessa feature.
    var reflexoes: [ReflexaoEstudanteInfoModel]
    
    /// Dados dos Objetivos de Aprendizado utilizados nessa feature.
    var objetivos: [ObjetivoEstudanteInfoModel]
}
