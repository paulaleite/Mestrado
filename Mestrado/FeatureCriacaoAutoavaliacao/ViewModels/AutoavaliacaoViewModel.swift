//
//  CriacaoAutoavaliacaoViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import Foundation

/// Classe que possibilita a manipulação dos dados da Tela de Criação de uma Autoavaliação, permitindo que ele informe a data, reflexão e o nível nos objetivos. Também possibilita o acesso das informações.
class AutoavaliacaoViewModel: ObservableObject {
    
    // MARK: - Variávies e Constantes
    
    /// Source of Truth dos momentos avaliativos do Estudante, dentro da Disciplina.
    @Published var momentos: [MomentoAvaliativoTituloModel] = []
    
    /// Source of Truth dos objetivos de aprendizado de um Momento Avaliativo.
    @Published var objetivos: [ObjetivoAutoavaliacaoModel] = []
    
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
        
        //        getDadosCriacaoAutoavaliacao(estudanteID: estudanteID, disciplinaID: disciplinaID)
    }
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Criação de uma Autoavaliação.
    /// Para isso, serão buscadas as informações dos Momento Avaliativos de uma Disciplina, bem como os Objetivos de Aprendizado associados a elas.
    /// - Parameter estudanteID: a String que possui o ID do Estudante.
    /// - Parameter disciplinaID: a String que possui o ID da Disciplina.
    @MainActor internal func getDadosCriacaoAutoavaliacao(estudanteID: String, disciplinaID: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDadosAutoavaliacao(estudanteID: estudanteID, disciplinaID: disciplinaID)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.momentos = resultado.0!.momentos
            self.objetivos = resultado.0!.objetivos
        }
        
        self.estaBuscando = false
    }
    
    @MainActor internal func postDadosAutoavaliacao(autoavaliacao: PostAutoavaliacaoModel, disciplinaID: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.postDadosAutoavaliacao(dados: autoavaliacao, disciplinaID: disciplinaID)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            print(resultado.0!)
        }
    }
    
    func criarAutoavaliacao() {
        // Talvez colocar como Pulblished lá na ViewModel e criar lá o Objetivo, qdo estiver pronto, chamar a função.
        // Talvez ter todas os itens como Published aqui.
        // Talvez colocar PostObjetivoModel como Published aqui...
        var objsAvaliados: [PostObjetivoModel]
        for obj in objetivos {
            objsAvaliados.append(PostObjetivoModel(objetivoID: obj.id, rubricaSelecionada: obj.rubricaSelecionada))
        }
//        var autoavaliacao = PostAutoavaliacaoModel(estudanteID: estudanteID, momentoAvaliativoID: momentoAvaliativoSelecionado, data: data, sentimento: sentimentoSelecionado, descricao: descricaoReflexao, objetivosAvaliados: objsAvaliados)
    }
}
