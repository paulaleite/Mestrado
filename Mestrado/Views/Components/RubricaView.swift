//
//  RubricaView.swift
//  Mestrado
//
//  Created by Paula Leite on 06/07/23.
//

import Foundation
import SwiftUI

/// A Rubrica View constroi a visualização do nível em que um Estudante se encontra em um Objetivo de Aprendizado. Isso é feito com o uso de Retângulos, os quais representam cada um dos seis níveis possíveis. Também existe um Triângulo logo acima do conjunto de Retângulos, que representa o nível esperado do Professor, daquele Objetivo de Aprendizado.
struct RubricaView: View {
    // MARK: - Variáveis e Constantes
    /// Representa a cor da Competência do Objetivo de Aprendizado
    var corCompetencia: Color
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo aprensetado no elemento da lista, representada por um Int entre 0 e 5.
    var rubricaSelecionada: Int
    /// A Rubrica escolhida pelo Professor, que o Estudante precisa atingir até o final da Disciplina, representada por um Int entre 0 e 5.
    var nivelEsperado: Int
    /// Representa o tamanho do elemento retangular customizado de cada Rubrica.
    var tamanho: [CGFloat]
    /// Representa a cor que é colocada no elemento retangular customizado de cada Rubrica, quando não existe um nível configurado pelo Estudante.
    let corFundoSemRubrica: Color = .fundo3
    
    // MARK: - Inicializadores
    /// Inicializador que converte as variáveis de objetivoNivel e nivelEsperado, de Rubrica para Int.
    /// - Parameter corCompetencia: Representa a cor da Competência do Objetivo de Aprendizado.
    /// - Parameter objetivoNivel: A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo aprensetado no elemento da lista.
    /// - Parameter nivelEsperado: A Rubrica escolhida pelo Professor, que o Estudante precisa atingir até o final da Disciplina.
    /// - Parameter tamanho: Representa o tamanho do elemento retangular customizado de cada Rubrica.
    init(corCompetencia: Color, objetivoNivel: Rubrica, nivelEsperado: Rubrica, tamanho: [CGFloat]) {
        self.corCompetencia = corCompetencia
        
        switch objetivoNivel {
            case .naoEstudado: self.rubricaSelecionada = 0
            case .muitoInsatisfeito: self.rubricaSelecionada = 1
            case .parcialmenteInsatisfeito: self.rubricaSelecionada = 2
            case .nemSatisfeitoNemInsatisfeito: self.rubricaSelecionada = 3
            case .parcialmenteSatisfeito: self.rubricaSelecionada = 4
            case .muitoSatisfeito: self.rubricaSelecionada = 5
        }
        
        switch nivelEsperado {
            case .naoEstudado: self.nivelEsperado = 0
            case .muitoInsatisfeito: self.nivelEsperado = 1
            case .parcialmenteInsatisfeito: self.nivelEsperado = 2
            case .nemSatisfeitoNemInsatisfeito: self.nivelEsperado = 3
            case .parcialmenteSatisfeito: self.nivelEsperado = 4
            case .muitoSatisfeito: self.nivelEsperado = 5
        }
        
        self.tamanho = tamanho
    }
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 4) {
                RetanguloArrendado(retanguloDTO: RetanguloDTO(corCompetencia: rubricaSelecionada > 0 ? corCompetencia : corFundoSemRubrica, nivelEsperado: nivelEsperado, tamanho: tamanho, qualRetangulo: 1), retanguloEsquerda: FormaBordaArrendondadoEsquerda(raio: 4))
                
                ForEach(2 ..< 5) { i in
                    RetanguloMeio(retanguloDTO: RetanguloDTO(corCompetencia: rubricaSelecionada > (i - 1) ? corCompetencia : corFundoSemRubrica, nivelEsperado: nivelEsperado, tamanho: tamanho, qualRetangulo: i))
                }
                
                RetanguloArrendado(retanguloDTO: RetanguloDTO(corCompetencia: rubricaSelecionada > 4 ? corCompetencia : corFundoSemRubrica, nivelEsperado: nivelEsperado, tamanho: tamanho, qualRetangulo: 5), retanguloDireita: FormaBordaArrendondadoDireita(raio: 4))
            }
        }
    }
}
