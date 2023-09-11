//
//  PostDisciplinaViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Classe que possibilita a manipulação dos dados da Tela de Criação de uma disicipflina, que busca dados do servidor para popular a visualização, bem como salva as informações escolhidas pelo Professor.
class PostDisciplinaViewModel: ObservableObject {
    // MARK: - Variáveis e Constantes
    /// Source of Truth da Disciplina.
    @Published var disciplina: PostDisciplinaModel? = nil
    
    /// Source of Truth do título da Disciplina.
    @Published var titulo: String = ""
    
    /// Source of Truth dos Momentos Avaliativos criados.
    @Published var momentoAvaliativo: [MomentoAvaliativoPostDisciplinaModel] = []
    
    /// Source of Truth dos estudantes que fazem parte da Disciplina
    @Published var estudantes: [EstudanteGetPostDisciplinaModel] = []
    
    /// Source of Truth dos Objetivos de Aprendizado existentes.
    @Published var objetivosDeAprendizadoDisponiveis: [ObjetivoGetPostDisciplinaModel] = []

    /// Source of Truth dos Estudantes disponíveis.
    @Published var estudantesDisponiveis: [EstudanteGetPostDisciplinaModel] = []
    
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
    /// Essa função vai buscar no servidor, os dados necessários para construir a Feature de Criação de uma Disciplina, consultada pelo Professor.
    @MainActor internal func getDadosCriacaoDisciplina() async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.getDadosCriacaoDisciplina()
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            self.objetivosDeAprendizadoDisponiveis = resultado.0!.objetivos
            self.estudantesDisponiveis = resultado.0!.estudantes
        }
        self.estaBuscando = false
    }
    
    /// Essa função envia os dados da Disciplina para o servidor.
    /// - Parameter dados: Dados do objetivo
    @MainActor internal func postDadosCriacaoDisciplina(dados: PostDisciplinaModel) async {
        estaBuscando = true
        mensagemDeErro = nil
        
        let resultado = await servico.postDadosCriacaoDisciplina(dados: dados)
        if resultado.1 != nil {
            mensagemDeErro = resultado.1?.descricao
        } else {
            print(resultado.0!)
        }
    }
    
    /// Função que atuailiza o Momento Avaliativo, em relação aos Objetivos.
    /// - Parameter titulo: Título do Momento Avaliativo.
    /// - Parameter data: Data em que o Momento Avaliativo vai acontecer.
    /// - Parameter objetivos: Objetivos que estão sendo adicionados.
    func atualizarMomentoAvaliativo(titulo: String, data: String, objetivo: ObjetivosPostDisciplinaModel) {
        for i in 0 ..< self.momentoAvaliativo.count {
            if self.momentoAvaliativo[i].titulo == titulo && self.momentoAvaliativo[i].data == data {
                if self.momentoAvaliativo[i].objetivos.count != 0 {
                    if !(self.momentoAvaliativo[i].objetivos.contains(where: { $0.id == objetivo.id })) {
                        self.momentoAvaliativo[i].objetivos.append(objetivo)
                    }
                } else {
                    self.momentoAvaliativo[i].objetivos.append(objetivo)
                }
            }
        }
    }
    
    /// Função que remove o Objetivo dos Momentos Avaliativos.
    /// - Parameter titulo: Títul odo Momento Avaliativo.
    /// - Parameter data: Data em que o Momento Avaliativo vai acontecer.
    /// - Parameter objetivoID: Identificador único do objetivo.
    func removerObjetivo(titulo: String, data: String, objetivoID: String) {
        for i in 0 ..< self.momentoAvaliativo.count {
            if self.momentoAvaliativo[i].titulo == titulo && self.momentoAvaliativo[i].data == data {
                self.momentoAvaliativo[i].objetivos.removeAll {
                    $0.id == objetivoID
                }
            }
        }
    }
    
    /// Função que permite atualizar a rubrica selecionada do Objetivo de Aaprendizado dentro de um Momento Avaliativo
    /// - Parameter titulo: Título do Momento Avaliativo.
    /// - Parameter data: Data em que o Momento Aavaliativo vai acontecer
    /// - Parameter objetivoID: Identificador único do Objetivo que será atualizado
    /// - Parameter nivelEsperado: Nível esperado que será atualizado
    func atualizarObjetivo(titulo: String, data: String, objetivoID: String, nivelEsperado: Rubrica) {
        for i in 0 ..< self.momentoAvaliativo.count {
            if self.momentoAvaliativo[i].titulo == titulo && self.momentoAvaliativo[i].data == data {
                for j in 0 ..< self.momentoAvaliativo[i].objetivos.count {
                    if self.momentoAvaliativo[i].objetivos[j].id == objetivoID {
                        self.momentoAvaliativo[i].objetivos[j].nivelEsperado = nivelEsperado.rawValue
                    }
                }
            }
        }
    }
    
    /// Função que cria o Momento Avaliativo novo, mas não adiciona os Objetivos de Aprendizado.
    /// - Parameter titulo: Título do Momento Avaliativo.
    /// - Parameter data: Data em que o Momento Avaliativo vai acontecer.
    func criarMomentoAvaliativo(titulo: String, data: String) {
        let momento = MomentoAvaliativoPostDisciplinaModel(titulo: titulo, data: data, objetivos: [])
        self.momentoAvaliativo.append(momento)
    }
    
    /// Função que atuailiza as variáveis @Published com as informações selecionadas pelo Professor.
    /// - Parameter titulo: Titulo da Disciplina.
    /// - Parameter momentosAvaliativos: Momentos Avaliativos criados pelo Professor.
    /// - Parameter estudantes: Estudantes que vão fazer parte da Disciplina.
    func atualizarDisciplina(titulo: String) {
        self.titulo = titulo
        var estudantesAtualizados: [EstudantePostDisciplinaModel] = []
        for estudante in estudantes {
            estudantesAtualizados.append(EstudantePostDisciplinaModel(id: estudante.id))
        }
        self.disciplina = PostDisciplinaModel(titulo: titulo, momentoAvaliativo: self.momentoAvaliativo, estudantes: estudantesAtualizados)
    }
}
