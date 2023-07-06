//
//  RubricaView.swift
//  Mestrado
//
//  Created by Paula Leite on 06/07/23.
//

import Foundation
import SwiftUI


struct RubricaView: View {
    var cor: Color
    var objetivoNivel: Double
    var nivelEsperado: Double
    var tamanho: [CGFloat]
    
    init(cor: Color, objetivoNivel: Double, nivelEsperado: Double = 0, tamanho: [CGFloat]) {
        self.objetivoNivel = objetivoNivel
        self.nivelEsperado = nivelEsperado
        self.cor = cor
        self.tamanho = tamanho
    }
    
    init(cor: Color, objetivoNivel: Rubrica, nivelEsperado: Rubrica = .naoEstudado, tamanho: [CGFloat]) {
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
        let corBase = Color("Fundo3")
        let corEsperada = corBase
        
        ZStack {
            HStack(spacing: 4) {
                RetanguloArrendadoEsquerda(cor: objetivoNivel > 0 ? cor : nivelEsperado > 0 ? corEsperada : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado)
                RetanguloMeio1(cor: objetivoNivel > 1 ? cor : nivelEsperado > 1 ? corEsperada : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado)
                RetanguloMeio2(cor: objetivoNivel > 2 ? cor : nivelEsperado > 2 ? corEsperada : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado)
                RetanguloMeio3(cor: objetivoNivel > 3 ? cor : nivelEsperado > 3 ? corEsperada : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado)
                RetanguloArrendadoDireita(cor: objetivoNivel > 4 ? cor : nivelEsperado > 4 ? corEsperada : corBase, tamanho: tamanho, nivelEsperado: nivelEsperado)
            }
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RubricaView(cor: Color("Competencia1"), objetivoNivel: -1, nivelEsperado: 0, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 0, nivelEsperado: 1, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 1, nivelEsperado: 3, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 2, nivelEsperado: 2, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 3, nivelEsperado: 4, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 4, nivelEsperado: 5, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 5, nivelEsperado: -1, tamanho: [30, 10])
            RubricaView(cor: Color("Competencia1"), objetivoNivel: 5, nivelEsperado: 5, tamanho: [30, 10])
        }
    }
}
