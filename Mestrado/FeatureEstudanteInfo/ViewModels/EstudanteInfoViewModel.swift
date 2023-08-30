//
//  AutoavaliacaoEstudanteInfoViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados da Tela de Informações do Estudante, permitindo que ele visualize informações sobre o seu estado na disciplina.
class EstudanteInfoViewModel: ObservableObject {
    
    // MARK: - Variávies e Constantes
    
    /// Source of Truth dos dados do Gráfico do Estudante.
    @Published var qtdObjsPorCompetencia: [GraficoEstudanteInfoModel] = []
    
    /// Source of Truth dos momentos avaliativos do Estudante, dentro da Disciplina.
    @Published var momentosAvaliativos: [MomentoAvaliativoTituloModel] = []
    
    /// Source of Truth das reflexões do Estudante, dentro da Disciplina.
    @Published var reflexoes: [ReflexaoEstudanteInfoModel] = []
    
    /// Source of Truth dos objetivos do Estudante, dentro da Disciplina.
    @Published var objetivos: [ObjetivoEstudanteInfoModel] = []
    
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
        
        //        getDadosInfoEstudante(estudanteID: estudanteID, disciplinaID: disciplinaID)
    }
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Informações do Estudante.
    /// Para isso, serão adquiridas as informações dos dados que ajudarão a construir o gráfico do Estudante, bem como os Momentos Avaliativos daquela Disciplina, as Reflexões que o usuário já executou e os objetivos que ele já revisou.
    /// - Parameter estudanteID: a String que possui o ID do Estudante.
    /// - Parameter disciplinaID: a String que possui o ID da Disciplina.
    @MainActor internal func getDadosInfoEstudante(estudanteID: String, disciplinaID: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDadosInfoEstudante(estudanteID: estudanteID, disciplinaID: disciplinaID)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.qtdObjsPorCompetencia = resultado.0!.qtdObjsPorCompetencia
            self.momentosAvaliativos = resultado.0!.momentosAvaliativos
            self.reflexoes = resultado.0!.reflexoes
            self.objetivos = resultado.0!.objetivos
        }
        self.estaBuscando = false
    }
}
