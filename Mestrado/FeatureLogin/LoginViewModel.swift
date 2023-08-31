//
//  LoginViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - Variáveis e Constantes
    
    /// Source of Truth da Pessoa.
    @Published var pessoa: LoginModel?
    /// Source of Truth de se os dados que estão sendo buscados no Servidor.
    @Published var estaBuscando: Bool = false
    /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
    @Published var mensagemDeErro: String? = nil
    
    /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
    let servico: APIServicoProtocol
    
    // MARK: - Inicializadores
    init(servico: APIServicoProtocol = APIServico()) {
        self.servico = servico
    }
    
    // MARK: - Funções
    
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Criação de uma Autoavaliação.
    /// Para isso, serão buscadas as informações dos Momento Avaliativos de uma Disciplina, bem como os Objetivos de Aprendizado associados a elas.
    /// - Parameter estudanteID: a String que possui o ID do Estudante.
    /// - Parameter disciplinaID: a String que possui o ID da Disciplina.
    @MainActor internal func getPessoa(pessoaID: String, senha: String, tipo: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getPessoaPeloID(pessoaID: pessoaID, senha: senha, tipo: tipo)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.pessoa = resultado.0!
        }
        
        self.estaBuscando = false
    }
}
