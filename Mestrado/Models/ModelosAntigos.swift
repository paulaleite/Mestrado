//
//  ModelosAntigos.swift
//  Mestrado
//
//  Created by Paula Leite on 30/08/23.
//

import Foundation

/*
 
 /// Entidade do Estudante.
 struct Estudante: Codable, Identifiable {
     
     /// Identificador único do Estudante.
     var id: String
     
     /// Número de identificação único do Estudante, fornecido pela Universidade.
     let numeroDeIdentificacao: Double?
     
     /// Nome do Estudante.
     let nome: String
     
     /// As autoavaliações que um Estudante já realizou.
     var autoavaliacoes: [AutoAvaliacao]
 }
 
 /// Entidade do Professor.
 struct Professor: Codable, Identifiable {
     
     /// Identificador único do Professor.
     var id: String
     
     /// Número de identificação único do Professor, fornecido pela Universidade.
     let numeroDeIdentificacao: Double?
     
     /// Nome do Professor.
     let nome: String
     
     /// Lista de Disciplinas que o Professor ministra.
     var disciplinas: [Disciplina]
 }

/// Entidade da Disciplina.
struct Disciplina: Codable, Identifiable {
    
    /// Identificador único da Disciplina.
    var id: String
    
    /// Título descritivo da Disciplina.
    var titulo: String
    
    /// Lista de Momentos Avaliativos que acontecerão durante a Disciplina.
//    var momentosAvaliativos: [MomentoAvaliativo]
    
    /// Lista dos estudantes que participarão da Disciplina.
    var estudantes: [Estudante]
}
 
 /// Entidade do Objetivo de Aprendizado.
 struct ObjetivoDeAprendizado: Codable, Identifiable {
     
     /// Identificador único do Objetivo de Aprendizado.
     var id: String
     
     /// Descrição detalhada do Objetivo de Aprendizado.
     var descricao: String
     
     /// Rubrica esperada para esse objetivo de aprendizado, determinada pelo Professor.
     var nivelEsperado: Rubrica?
     
     /// Nome da Competência do Objetivo de Aprendizado.
     var nomeCompetencia: String?
     
     /// Cor da Competência em que o Objetivo de Aprendizado se encocntra.
     var corCompetencia: String?
 }
 
 /// Entidade da Competência.
 struct Competencia: Codable, Identifiable {
     
     /// Identificador único da Competência.
     var id: String
     
     /// Nome da Competência.
     var nome: String
     
     /// Nome da Cor da Competência.
     var nomeCor: String
     
     /// Objetivos de Aprendizado que pertencem a essa Competência.
     var objetivosDeAprendizado: [ObjetivoDeAprendizado]
 }

 /// Entidade que representa a Auto Avaliação que o Estudante realiza em um determinado Momento Avaliativo.
 struct AutoAvaliacao: Codable, Identifiable {
     
     /// Identificador único da Autoavaliação.
     var id: String
     
     /// Os Objetivos de Aprendizado que o Estudante avaliou.
     var avalicao: [ObjetivoDeAprendizadoAvaliado]
     
     /// O Sentimento que o Estudante selecionou em relação ao Momento Avaliativo.
     var sentimentoSelecionado: Sentimento
     
     /// A reflexão textual que o Estudante fez.
     var reflexaoTextual: String
     
     /// O Momento Avaliativo em que a Autoavaliação está acontecendo.
     var momentoAvaliativo: MomentoAvaliativo
     
     /// A data em que o Estudante está realizando a Autoavaliação.
     var data: Date
 }
 
 /// Entidade que representa o Objetivo de Aprendizado no seu estado Avaliado.
 /// Isso foi necessário para que sempre houvesse a relação entre a Rubrica e o Objetivo de Aprendizado.
 struct ObjetivoDeAprendizadoAvaliado: Codable, Identifiable {
     
     /// Identificador único do Objetivo de Aprendizado Avaliado.
     var id: String
     
     /// O Objetivo de Aprendizado  que está sendo avaliado.
     var objetivoDeAprendizadoID: String
     
     /// A Rubrica escolhida para o Objetivo de Aprendizado em avaliação.
     var rubricaSelecionada: Rubrica
 }
 
*/
