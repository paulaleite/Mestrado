//
//  ProfessorInfoViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados da Tela de Informações do Professor, permitindo que ele visualize informações sobre o estado da turma na Disciplina.
class ProfessorInfoViewModel: ObservableObject {
    // MARK: - Variávies e Constantes
    
    /// Source of Truth dos dados do Gráfico do Professor.
    @Published var dadosGrafico: [GraficoProfessorModel] = []
    
    /// Source of Truth  de todos os estudantes, em uma Disciplina.
    @Published var estudantesFiltro1: [EstudanteFiltroModel] = []
    
    /// Source of Truth  de todos os estudantes, sem avaliação, em uma Disciplina.
    @Published var estudantesFiltro2: [EstudanteFiltroModel] = []
    
    /// Source of Truth  de todos os estudantes, com objetivos abaixo do nível, em uma Disciplina.
    @Published var estudantesFiltro3: [EstudanteFiltroModel] = []
    
    /// Source of Truth  de todos os estudantes, com objetivos acima do nível, em uma Disciplina.
    @Published var estudantesFiltro4: [EstudanteFiltroModel] = []
    
    /// Source of Truth de se os dados que estão sendo buscados no Servidor.
    @Published var estaBuscando: Bool = false
    
    /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
    @Published var mensagemDeErro: String? = nil
    
    /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
    let servico: APIServicoProtocol
    
    /// Variável que representa a String com o Identificador Único do Estudante.
    var estudanteID: String = ""
    /// Variável que representa a String com o Identificador Único da Disciplina.
    var disciplinaID: String = ""
    
    // MARK: - Inicializadores
    init(servico: APIServicoProtocol = APIServico()) {
        self.servico = servico
    }
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Informações do Professor.
    /// Para isso, serão adquiridas as informações dos dados que ajudarão a construir o gráfico do Professor, bem como os estudantes, filtrados da forma correta.
    /// - Parameter disciplinaID: a String que possui o ID da Disciplina.
    @MainActor internal func getDadosInfoProfessor(disciplinaID: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDadosInfoProfessor(disciplinaID: disciplinaID)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.dadosGrafico = resultado.0!.dadosGrafico
            self.estudantesFiltro1 = resultado.0!.estudantesFiltro1
            self.estudantesFiltro2 = resultado.0!.estudantesFiltro2
            self.estudantesFiltro3 = resultado.0!.estudantesFiltro3
            self.estudantesFiltro4 = resultado.0!.estudantesFiltro4
        }
        self.estaBuscando = false
    }
}
