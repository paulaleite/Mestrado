//
//  PostDisciplinaViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Classe que possibilita a manipulação dos dados da Tela de Criação de uma disicipflina, que busca dados do servidor para popular a visualização, bem como salva as informações escolhidas pelo Professor.
class PostDisciplinaViewModel: ObservableObject {
    /// Source of Truth do título da Disciplina.
    @Published var titulo: String = ""
    
    /// Source of Truth dos Momentos Avaliativos criados.
    @Published var momentoAvaliativo: [MomentoAvaliativoPostDisciplinaModel] = []
    
    /// Source of Truth dos estudantes que fazem parte da Disciplina
    @Published var estudantes: [EstudantePostDisciplinaModel] = []
    
    /// Source of Truth dos Objetivos de Aprendizado existentes.
//    @Published var objetivosDeAprendizadoTodos = []

    /// Source of Truth dos Estudantes disponíveis.
//    @Published var estudantes = []
}
