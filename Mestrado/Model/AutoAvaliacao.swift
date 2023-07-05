//
//  AutoAvaliacao.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation

/// Entidade que representa a Auto Avaliação que o Estudante realiza em um determinado Momento Avaliativo.
struct AutoAvaliacao: Codable, Identifiable {
    
    /// Identificador único da Auto Avaliação.
    var id: String
    
    /// Os Objetivos de Aprendizado que o Estudante avaliou.
    var objetivosDeAprendizadoSendoAvaliados: [ObjetivoDeAprendizadoAvaliado]
    
    /// O Sentimento que o Estudante selecionou em relação ao Momento Avaliativo.
    var sentimentoSelecionado: Sentimento
    
    /// A reflexão textual que o Estudante fez.
    var reflexaoTextual: String
    
    /// O Momento Avaliativo em que a Auto Avaliação está acontecendo.
    var momentoAvaliativo: MomentoAvaliativo
    
    /// A data em que o Estudante está realizando a Auto Avaliação.
    var data: Date
    
    
}
