//
//  ViewModelsAntigas.swift
//  Mestrado
//
//  Created by Paula Leite on 30/08/23.
//

import Foundation

/*
 /// Classe que possibilita a manipulação dos dados do Estudante, possibilitando acesso a todos os estudantes de uma disciplina, ou apenas ao estudante que está acessando o sistema.
 class EstudanteFetcher: ObservableObject {
     
     // MARK: Variáveis e Constantes
     
     /// Source of Truth do Estudante que está acessando o sistema.
     @Published var estudante: Estudante?
     
     /// Source of Truth de todos os Estudantes que participam de uma disciplina, utilizado pelo Professor.
     @Published var estudantes: [Estudante]?
     
     /// Source of Truth de se os dados estando sendo buscados no Servidor.
     @Published var estaBuscando: Bool = false
     
     /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
     @Published var mensagemDeErro: String? = nil
     
     /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
     let servico: APIServicoProtocol
     
     // MARK: Inicializadores
     
     /// Inicializador do EstudanteFetcher.
     /// - Parameter servico: Conexão com o serviço de acesso aos dados da API.
     init(servico: APIServicoProtocol = APIServico()) {
         self.servico = servico
     }
     
     // MARK: - Funções
     
     /// Essa função vai buscar no servidor, um Estudante específico, de acordo com seu ID.
     /// - Parameter id: a String que possui o ID do Estudante.
     internal func getEstudantePorID(estudante id: String) {
         estaBuscando = true
         mensagemDeErro = nil
         
         Task {
             do {
                 estudante = try await servico.getEstudantePorID(estudante: id)
             } catch(let e) {
                 mensagemDeErro = e.localizedDescription
             }
             estaBuscando = false
         }
     }
 }

 /// Classe que possibilita a manipulação dos dados do Professor, possibilitando acesso a todos os professores de uma disciplina, ou apenas ao professor que está acessando o sistema.
 class ProfessorFetcher: ObservableObject {
     
     // MARK: Variáveis e Constantes
     
     /// Source of Truth do Professor que está acessando o sistema.
     @Published var professor: Professor?
     
     /// Source of Truth de todos os Professores.
     @Published var professores: [Professor]?
     
     /// Source of Truth de se os dados estando sendo buscados no Servidor.
     @Published var estaBuscando: Bool = false
     
     /// Source of Truth de erros que ocorram enquando os dados estão sendo buscados no Servidor.
     @Published var mensagemDeErro: String? = nil
     
     /// Constante que representa o serviço de acesso à API, com o qual é possível utilizar as ferramentas de acesso à mesma.
     let servico: APIServicoProtocol
     
     // MARK: Inicializadores
     
     /// Inicializador do EstudanteFetcher.
     /// - Parameter servico: Conexão com o serviço de acesso aos dados da API.
     init(servico: APIServicoProtocol = APIServico()) {
         self.servico = servico
     }
     
     // MARK: - Funções
     
     /// Essa função vai buscar no servidor, um Professor específico, de acordo com seu ID.
     /// - Parameter id: a String que possui o ID do Professor.
     internal func getProfessorPorID(professor id: String) {
         estaBuscando = true
         mensagemDeErro = nil
         
         Task {
             do {
                 professor = try await servico.getProfessorPorID(professor: id)
             } catch APIErro.URLInvalida {
                 mensagemDeErro = APIErro.URLInvalida.descricao
             } catch APIErro.dadoInvalido {
                 mensagemDeErro = APIErro.dadoInvalido.descricao
             } catch APIErro.respostaInvalida {
                 mensagemDeErro = APIErro.respostaInvalida.descricao
             }
         }
     }
 }

 
 */
