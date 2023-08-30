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
    @Published var momentos: [MomentoAvaliativoModel] = []
    
    /// Source of Truth dos objetivos de aprendizado de um Momento Avaliativo.
    @Published var objetivos: [ObjetivoAutoavaliacaoModel] = []
    
    /// Source of Truth de se os dados que estão sendo buscados no Servidor.
    @Published var estaBuscando: Bool = false
    
    /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
    @Published var mensagemDeErro: String? = nil
    
    @Published var autoavaliacao: PostAutoavaliacaoModel? = nil
    
    @Published var objetivosAvaliados: [PostObjetivoModel] = []
    
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
    
    func criarObjetivos(objetivos: [ObjetivoAutoavaliacaoModel]) {
        if objetivosAvaliados.isEmpty {
            for obj in objetivos {
                objetivosAvaliados.append(PostObjetivoModel(objetivoID: obj.id, rubricaSelecionada: obj.rubricaSelecionada.rawValue))
            }
        }
    }
    
    func atualizarObjetivo(objetivoID: String, rubricaSelecionada: Int) {

            if !objetivosAvaliados.isEmpty {
                for i in 0 ..< objetivosAvaliados.count {
                    if objetivoID == objetivosAvaliados[i].objetivoID {
                        objetivosAvaliados[i].rubricaSelecionada = rubricaSelecionada
                    }
                }
            }
    }
    
    func atualizarAutoavaliacao(estudanteID: String, momentoID: String, data: String, sentimento: Int, descricao: String, objetivos: [ObjetivoAutoavaliacaoModel]) {
        autoavaliacao = PostAutoavaliacaoModel(estudanteID: estudanteID, momentoAvaliativoID: momentoID, data: data, sentimento: sentimento, descricao: descricao, objetivosAvaliados: self.objetivosAvaliados)
    }
}
