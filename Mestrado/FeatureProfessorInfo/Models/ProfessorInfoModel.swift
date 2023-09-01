//
//  ProfessorInfoModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

/// Entidade que representa todos os dados que são necessários para construir a tela de Informações do Professor, sendo os dados para o gráfico e dos estudantes.
struct ProfessorInfoModel: Codable {
    /// Dados do gráfico
    var dadosGrafico: [GraficoProfessorModel]
    
    /// Dados dos estudantes no Filtro 1
    var estudantesFiltro1: [EstudanteFiltroModel]
    
    /// Dados dos estudantes no Filtro 2
    var estudantesFiltro2: [EstudanteFiltroModel]
    
    /// Dados dos estudantes no Filtro 3
    var estudantesFiltro3: [EstudanteFiltroModel]
    
    /// Dados dos estudantes no Filtro 4
    var estudantesFiltro4: [EstudanteFiltroModel]
}
