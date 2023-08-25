//
//  GraficoEstudanteModel.swift
//  Mestrado
//
//  Created by Paula Leite on 25/08/23.
//

import Foundation

/// Entidade que possui as informações necessárias para construir o gráfico do Estudante.
/// Ele representa a quantidade de objetivos que o Estudante concluiu de acordo com cada uma das Competências. Além disso, informa a média da turma para cada uma das Competências.
struct GraficoEstudanteModel: Codable, Identifiable {
    
    /// Identificador único do Gráfico do Estudante
    var id: String
    
    /// Título da Competência
    var titulo: String
    
    /// Número de Objetivos de Aprendizado que o Estudante concluí na Competência.
    var qtdObjetivosConcluidos: Int
    
    /// Número de Objetivos de Aprendizado totais referentes à Competência.
    var qtdObjetivosTotais: Int
    
    /// Média de Objetivos de Aprendizado concluídos pela turma.
    var mediaDaTurma: Int
}
