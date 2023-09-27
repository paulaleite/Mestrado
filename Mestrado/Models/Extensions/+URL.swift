//
//  +URL.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

//var connectionURL = "http://localhost:3000/"
var URLConexao = "https://developeracademy.herokuapp.com/"

extension String {
    /// Variável que permite acessar o endpoint específico para procurar na API Estudnate.
    static var getEstudante: String {
        criarEndpoint("estudantes/")
    }
    
    static var getProfessor: String {
        criarEndpoint("professores")
    }
    
    static var postDadoAutoavaliacao: String {
        criarEndpoint("objetivos")
    }
    
    static var postDadoCriacaoDisciplina: String {
        criarEndpoint("disciplina/")
    }
    
    /// Função que une o endpoint específico de uma URL, com a URL da API.
    static private func criarEndpoint(_ endpoint: String) -> String {
        return URLConexao + "\(endpoint)"
    }
}
