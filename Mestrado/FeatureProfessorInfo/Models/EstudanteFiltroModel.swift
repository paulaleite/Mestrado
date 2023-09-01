//
//  EstudanteFiltroModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

/// Entidade que representa o Estudante, com as informações necessárias para a tela de Informações do Professor.
struct EstudanteFiltroModel: Codable, Hashable {
    /// Identificado único.
    var id: String
    
    /// Nome do Estudante.
    var nome: String
    
    /// Número de Objetivos fora do nível que o Estudante tem.
    var numObjsForaDoNivel: Int
    
    /// Número de Objetivos sem avaliação que o Estudante tem.
    var numObjsSemAvaliacao: Int
}
