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
    /// Representa a cor da Competência do Objetivo de Aprendizado
    var cor: Color
    var objetivoNivel: Int
    var nivelEsperado: Int
    var tamanho: [CGFloat]
    
    let corBase = Color("Fundo3")
    
    init(cor: Color, objetivoNivel: Rubrica, nivelEsperado: Rubrica, tamanho: [CGFloat]) {
        self.cor = cor
        self.tamanho = tamanho
        
        switch objetivoNivel {
            case .naoEstudado: self.objetivoNivel = 0
            case .muitoInsatisfeito: self.objetivoNivel = 1
            case .parcialmenteInsatisfeito: self.objetivoNivel = 2
            case .nemSatisfeitoNemInsatisfeito: self.objetivoNivel = 3
            case .parcialmenteSatisfeito: self.objetivoNivel = 4
            case .muitoSatisfeito: self.objetivoNivel = 5
        }
        
        switch nivelEsperado {
            case .naoEstudado: self.nivelEsperado = 0
            case .muitoInsatisfeito: self.nivelEsperado = 1
            case .parcialmenteInsatisfeito: self.nivelEsperado = 2
            case .nemSatisfeitoNemInsatisfeito: self.nivelEsperado = 3
            case .parcialmenteSatisfeito: self.nivelEsperado = 4
            case .muitoSatisfeito: self.nivelEsperado = 5
        }
    }
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 4) {
                RetanguloArrendado(dto: RetanguloDTO(cor: objetivoNivel > 0 ? cor : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado, qualRetangulo: 1), retanguloEsquerda: FormaBordaArrendondadoEsquerda(raio: 4))
                ForEach(2..<5) { i in
                    RetanguloMeio(dto: RetanguloDTO(cor: objetivoNivel > i-1 ? cor : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado, qualRetangulo: i))
                }
                RetanguloArrendado(dto: RetanguloDTO(cor: objetivoNivel > 4 ? cor : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado, qualRetangulo: 5), retanguloDireita: FormaBordaArrendondadoDireita(raio: 4))
            }
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RubricaView(cor: Color("Competencia1"), objetivoNivel: .muitoInsatisfeito, nivelEsperado: .muitoSatisfeito, tamanho: [30, 10])
        }
        .background(Color("Fundo1"))
    }
}
