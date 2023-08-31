//
//  GraficoProfessorModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

/// Entidade que possui as informações necessárias para construir o gráfico do Professor, as quais são categorizadas por Categoria. Ele apresenta a quantidade de objetivos avaliados por grupo de competência, contabilizando toda a turma.
struct GraficoProfessorModel: Codable, Hashable {
    /// Identificador único.
    var id: String
    
    /// Título da Competência.
    var titulo: String
    
    /// Nome da Cor da Competência.
    var corCompetencia: String
    
    /// Quantidade de Objetivos na Competência.
    var qtdObjetivos: Int
}
