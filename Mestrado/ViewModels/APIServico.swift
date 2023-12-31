//
//  APIService.swift
//  Mestrado
//
//  Created by Paula Leite on 04/07/23.
//

import Foundation

/// Implementação do protocolo APIServiceProtocol.
struct APIServico: APIServicoProtocol {
    
    let decodificador: JSONDecoder = JSONDecoder()
    
    /// Essa função decodifica um dado do tipo Data para um tipo T.
    /// - Parameter dado: dado no formato de Data.
    /// - Parameter tipo: tipo do dado desejado.
    /// - returns: tipo de dado T.
    func dadoDecodificado<T: Decodable>(dado: Data, tipo: T.Type) throws -> T {
        return try decodificador.decode(T.self, from: dado)
    }
    
    /// Essa função busca adquiri o Data a partir de uma URL contendo um JSON.
    /// - Parameter stringURL: URL do JSON desejado.
    /// - returns: dado adqurido pelo JSON da URL.
    func getDado(stringURL: String) async throws -> Data {
        let url = URL(filePath: stringURL)  // else { throw NSError() }
        //        let (dado, resposta) = try await URLSession.shared.data(from: url)
        let (dado, _) = try await URLSession.shared.data(from: url)
        
        //        guard let resposta = resposta as? HTTPURLResponse, resposta.statusCode == 200 else {
        //            throw APIErro.respostaInvalida
        //        }
        
        return dado
    }
    
    /// Essa função busca enviar dados no formato de JSON a partir de uma URL.
    /// - Parameter stringURL: URL no formato de String.
    /// - Parameter dados: Dados que serão enviados, já traduzidos do JSON.
    /// - returns: dado enviado para o servidor.
    func postDado(stringURL: String, dados: [String: Any]) async throws -> Data {
        let url = URL(filePath: stringURL)  // else { throw NSError() }
        
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requisicao.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            requisicao.httpBody = try JSONSerialization.data(withJSONObject: dados, options: .prettyPrinted)
        } catch (let erro) {
            print(erro.localizedDescription)
        }
        
        let (dado, _) = try await URLSession.shared.data(for: requisicao)
        
        return dado
    }
    
    /// Função que busca enviar dados no formato de JSON a partir de uma URL. Em seguida, decodifica o dado para o tipo desejado.
    /// - Parameter stringURL: URL do JSON desejado.
    /// - Parameter tipo: tipo do dado desejado.
    /// - returns: dados no formato do tipo T.
    func postDadoDecodificado<T: Decodable>(stringURL: String, dados: [String: Any], tipo: T.Type) async throws -> T {
        let dado = try await postDado(stringURL: stringURL, dados: dados)
        return try dadoDecodificado(dado: dado, tipo: T.self)
    }
    
    /// Função que busca o Data a partir de uma URL que contém um JSON. Em seguida, decodifica o dado para o tipo desejado.
    /// - Parameter stringURL: URL do JSON desejado.
    /// - Parameter dados: Dados que serão enviados, já traduzidos do JSON.
    /// - Parameter tipo: tipo do dado desejado.
    /// - returns: dados no formato do tipo T.
    func getDadoDecodificado<T: Decodable>(stringURL: String, tipo: T.Type) async throws -> T {
        let dado = try await getDado(stringURL: stringURL)
        return try dadoDecodificado(dado: dado, tipo: T.self)
    }
    
    /// Essa função busca do servidor, os dados da Pessoa, para que seja possível realizar o Login.
    /// - Parameter pessoaID: a String que possui o ID da Pessoa.
    /// - Parameter senha: Senha da Pessoa.
    /// - Parameter tipo: Tipo da Pessoa, podendo ser Professor ou Estudante.
    /// - returns: dados do Modelo de Login ou um APIErro.
    internal func getPessoaPeloID(pessoaID: String, senha: String, tipo: String) async -> (LoginModel?, APIErro?) {
        //        let stringURL: String = .getPessoa + "\(estudanteID)" + "\(senha)" + "\(tipo)"
        
        if let stringPath = Bundle.main.path(forResource: "getPessoa", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: LoginModel.self), nil)
            } catch (let e) {
                if let err = e as? APIErro {
                    return (nil, err)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    /// Essa função busca do servidor, as disciplinas de uma Pessoa.
    /// - Parameter pessoaID: a String que possui o ID da Pessoa.
    /// - Parameter senha: Senha da Pessoa.
    /// - Parameter tipo: Tipo da Pessoa, podendo ser Professor ou Estudante.
    /// - returns: dados do Modelo de Login ou um APIErro.
    internal func getDisciplinasDaPessoa(pessoaID: String, senha: String, tipo: String) async -> ([DisciplinaTituloModel]?, APIErro?) {
        //        let stringURL: String = .getDisciplinas + "\(estudanteID)" + "\(senha)" + "\(tipo)"
        
        if let stringPath = Bundle.main.path(forResource: "getDisciplinas", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: [DisciplinaTituloModel].self), nil)
            } catch (let e) {
                if let err = e as? APIErro {
                    return (nil, err)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    /// Essa função busca do servidor, os dados para a criação Tela de Informações do Estudante, permitindo que ele visualize informações sobre o seu estado na disciplina.
    /// - Parameter estudanteID: String do ID do Estudante.
    /// - Parameter disciplinaID: String do ID da Disciplina.
    /// - returns: dados do Modelo das Informações do Estudante.
    internal func getDadosInfoEstudante(estudanteID: String, disciplinaID: String) async -> (EstudanteInfoModel?, APIErro?) {
        //        let stringURL: String = .getGraficoEstudante + "\(estudanteID)" + "\(disciplinaID)"
        
        if let stringPath = Bundle.main.path(forResource: "getAutoavaliacoesEstudante", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: EstudanteInfoModel.self), nil)
            } catch (let e) {
                if let err = e as? APIErro {
                    return (nil, err)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    /// Essa função busca do servidor, os dados para necessários para construir a Feature de Criação de uma Autoavaliação..
    /// - Parameter estudanteID: String do ID do Estudante.
    /// - Parameter disciplinaID: String do ID da Disciplina.
    /// - returns: dados do Modelo de Criação de uma Autoavaliação.
    internal func getDadosAutoavaliacao(estudanteID: String, disciplinaID: String) async -> (AutoavaliacaoModel?, APIErro?) {
        //        let stringURL: String = .getDadoAutoavaliacao + "\(estudanteID)" + "\(disciplinaID)"
        
        if let stringPath = Bundle.main.path(forResource: "getAutoavaliacao", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: AutoavaliacaoModel.self), nil)
            } catch(let e) {
                if let erro = e as? APIErro {
                    return (nil, erro)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    internal func getDadosInfoProfessor(disciplinaID: String) async -> (ProfessorInfoModel?, APIErro?) {
        //        let stringURL: String = .getInfoProfessor + "\(disciplinaID)"
        
        if let stringPath = Bundle.main.path(forResource: "getInfoProfessor", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: ProfessorInfoModel.self), nil)
            } catch(let e) {
                if let erro = e as? APIErro {
                    return (nil, erro)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    internal func getDadosDetalhesEstudante(estudanteID: String, disciplinaID: String) async -> (EstudanteDetalhesModel?, APIErro?) {
        //        let stringURL: String = .getDetalhesEstudante + "\(estudanteID)" + "\(disciplinaID)"
        
        if let stringPath = Bundle.main.path(forResource: "getInfoDetalhesEstudante", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: EstudanteDetalhesModel.self), nil)
            } catch(let e) {
                if let erro = e as? APIErro {
                    return (nil, erro)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    internal func getDadosCriacaoDisciplina() async -> (GetDisciplinaModel?, APIErro?) {
//        let stringURL: String = .getPostDisciplina
        
        if let stringPath = Bundle.main.path(forResource: "getPostDisciplina", ofType: "json") {
            do {
                return (try await getDadoDecodificado(stringURL: stringPath, tipo: GetDisciplinaModel.self), nil)
            } catch(let e) {
                if let erro = e as? APIErro {
                    return (nil, erro)
                }
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    internal func postDadosAutoavaliacao(dados: PostAutoavaliacaoModel, disciplinaID: String) async -> (PostAutoavaliacaoModel?, APIErro?) {
        let stringURL: String = .postDadoAutoavaliacao + "\(dados.estudanteID)" + "\(disciplinaID)"
        
        var objs: [[String: Any]] = []
        
        for obj in dados.objetivosAvaliados {
            let objetivosAvaliados: [String: Any] = [
                "id": obj.objetivoID,
                "rubricaSelecionada": obj.rubricaSelecionada
            ]
            
            objs.append(objetivosAvaliados)
        }
        
        let autoavaliacaoInfo: [String: Any] = [
            "estudanteID": dados.estudanteID,
            "momentoAvaliativoID": dados.momentoAvaliativoID,
            "data": dados.data,
            "sentimento": dados.sentimento,
            "descricao": dados.descricao,
            "objetivosAvaliados": objs
        ]
        
        do {
            return (try await postDadoDecodificado(stringURL: stringURL, dados: autoavaliacaoInfo, tipo: PostAutoavaliacaoModel.self), nil)
        } catch (let e) {
            if let erro = e as? APIErro {
                return (nil, erro)
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
    
    internal func postDadosCriacaoDisciplina(dados: PostDisciplinaModel) async -> (PostDisciplinaModel?, APIErro?) {
        let stringURL: String = .postDadoCriacaoDisciplina
        
        var momentos: [[String: Any]] = []
        var objetivos: [[String: Any]] = []
        var estudantes: [[String: Any]] = []
        
        for momento in dados.momentoAvaliativo {
            for obj in momento.objetivos {
                let objs: [String: Any] = [
                    "id": obj.id,
                    "nivelEsperado": obj.nivelEsperado
                ]
                objetivos.append(objs)
            }
            let mom: [String: Any] = [
                "titulo": momento.titulo,
                "data": momento.data,
                "objetivos": objetivos
            ]
            momentos.append(mom)
            objetivos = []
        }
        
        for estudante in dados.estudantes {
            let estd: [String: Any] = [
                "id": estudante.id
            ]
            estudantes.append(estd)
        }
        
        let disciplinaInfo: [String: Any] = [
            "titulo": dados.titulo,
            "momentoAvaliativo": momentos,
            "estudantes": estudantes
        ]
        
        do {
            return (try await postDadoDecodificado(stringURL: stringURL, dados: disciplinaInfo, tipo: PostDisciplinaModel.self), nil)
        } catch (let e) {
            if let erro = e as? APIErro {
                return (nil, erro)
            }
        }
        
        return (nil, APIErro.URLInvalida)
    }
}

