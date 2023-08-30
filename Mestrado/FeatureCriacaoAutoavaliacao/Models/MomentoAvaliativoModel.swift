//
//  MomentoAvaliativoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 30/08/23.
//

import Foundation

/// Entidade que representa os Momentos Avaliativos do Estudante, que será utilizados na Tela de Informações do Estudante.
struct MomentoAvaliativoModel: Codable, Hashable {
    
    /// Identificador úncio do Momento Avaliativo
    var id: String
    
    /// Título do Momento Avaliativo
    var titulo: String
}
