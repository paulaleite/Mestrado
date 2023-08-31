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
    /// Source of Truth dos Títulos das Disciplinas da Pessoa
    @Published var disciplinas: [DisciplinaTituloModel]?
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
    
    /// Essa função vai buscar no servidor, os dados necessários para encontrar uma Pessoa.
    /// - Parameter pessoaID: a String que possui o ID da Pessoa.
    /// - Parameter senha: Senha da Pessoa.
    /// - Parameter tipo: Tipo da Pessoa, podendo ser Professor ou Estudante.
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
    
    /// Essa função vai buscar no servidor, as disciplinas de uma Pessoa.
    /// - Parameter pessoaID: a String que possui o ID da Pessoa.
    /// - Parameter senha: Senha da Pessoa.
    /// - Parameter tipo: Tipo da Pessoa, podendo ser Professor ou Estudante.
    @MainActor internal func getDisciplinasDaPessoa(pessoaID: String, senha: String, tipo: String) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDisciplinasDaPessoa(pessoaID: pessoaID, senha: senha, tipo: tipo)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.disciplinas = resultado.0!
        }
        
        self.estaBuscando = false
    }
    
    internal func removerPessoa() {
        pessoa = nil
    }
}
