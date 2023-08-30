//
//  ShapeCustomizada.swift
//  Mestrado
//
//  Created by Paula Leite on 06/07/23.
//

import Foundation
import SwiftUI

/// Elemento do tipo Shape que constroi um Retângulo com as duas pontas da esquerda arrendondados.
struct FormaBordaArrendondadoEsquerda: Shape {
    // MARK: - Variáveis e Constantes
    let raio: CGFloat
    
    // MARK: - Funcões
    /// Função que cria um elemento com as duas pontas da esquerda arrendondados.
    /// - Parameter rect: Representa o CGRect que será recebido.
    /// - Returns: A Path construída.
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let comecoTopoEsquerda = CGPoint(x: rect.minX, y: rect.minY + raio)
        let centroTopoEsquerda = CGPoint(x: rect.minX + raio, y: rect.minY + raio)
        let topoDireita = CGPoint(x: rect.maxX, y: rect.minY)
        let fundoDireita = CGPoint(x: rect.maxX, y: rect.maxY)
        let comecoFundoEsquerda = CGPoint(x: rect.minX + raio, y: rect.maxY)
        let centroFundoEsquerda = CGPoint(x: rect.minX + raio, y: rect.maxY - raio)
        
        path.move(to: comecoTopoEsquerda)
        path.addRelativeArc(center: centroTopoEsquerda, radius: raio, startAngle: Angle.degrees(180),
                            delta: Angle.degrees(90))
        path.addLine(to: topoDireita)
        path.addLine(to: fundoDireita)
        path.addLine(to: comecoFundoEsquerda)
        path.addRelativeArc(center: centroFundoEsquerda, radius: raio, startAngle: Angle.degrees(90),
                            delta: Angle.degrees(90))
        
        return path
    }
}

/// Elemento do tipo Shape que constroi um Retângulo com as duas pontas da direita arrendondados.
struct FormaBordaArrendondadoDireita: Shape {
    // MARK: - Variáveis e Constantes
    let raio: CGFloat
    
    // MARK: - Funcões
    /// Função que cria um elemento com as duas pontas da direita arrendondados.
    /// - Parameter rect: Representa o CGRect que será recebido.
    /// - Returns: A Path construída.
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topoEsquerda = CGPoint(x: rect.minX, y: rect.minY)
        let comecoTopoDireita = CGPoint(x: rect.maxX - raio, y: rect.minY)
        let centroTopoDireita = CGPoint(x: rect.maxX - raio, y: rect.minY + raio)
        let comecoFundoDireita = CGPoint(x: rect.maxX, y: rect.maxY - raio)
        let centroFundoDireita = CGPoint(x: rect.maxX - raio, y: rect.maxY - raio)
        let fundoEsquerda = CGPoint(x: rect.minX, y: rect.maxY)
        
        path.move(to: topoEsquerda)
        path.addLine(to: comecoTopoDireita)
        path.addRelativeArc(center: centroTopoDireita, radius: raio, startAngle: Angle.degrees(270),
                            delta: Angle.degrees(90))
        path.addLine(to: comecoFundoDireita)
        path.addRelativeArc(center: centroFundoDireita, radius: raio, startAngle: Angle.degrees(0),
                            delta: Angle.degrees(90))
        path.addLine(to: fundoEsquerda)
        path.addLine(to: topoEsquerda)
        
        return path
    }
}
