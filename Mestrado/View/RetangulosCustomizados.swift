//
//  RetangulosCustomizados.swift
//  Mestrado
//
//  Created by Paula Leite on 06/07/23.
//

import Foundation
import SwiftUI

struct RetanguloDTO {
    var cor: Color
    var corBorda: Color = Color.clear
    var tamanho: [CGFloat]
    var nivelEsperado: Int
    var qualRetangulo: Int
}

struct RetanguloArrendado: View {
    var dto: RetanguloDTO
    var retanguloEsquerda: FormaBordaArrendondadoEsquerda?
    var retanguloDireita: FormaBordaArrendondadoDireita?
    
    var body: some View {
        VStack {
            Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(dto.nivelEsperado == dto.qualRetangulo ? Color("Texto2") : .clear)
                .imageScale(.small)
                .padding(.top, 2)
            
            if let esquerda = retanguloEsquerda {
                Rectangle()
                    .fill(dto.cor)
                    .overlay(esquerda.stroke(dto.corBorda, lineWidth: 3.5))
                    .mask(esquerda)
                    .frame(width: dto.tamanho[0], height: dto.tamanho[1])
            }

            if let direita = retanguloDireita {
                Rectangle()
                    .fill(dto.cor)
                    .overlay(direita.stroke(dto.corBorda, lineWidth: 3.5))
                    .mask(direita)
                    .frame(width: dto.tamanho[0], height: dto.tamanho[1])
            }
        }
    }
}

struct RetanguloMeio: View {
    
    let dto: RetanguloDTO
    
    var body: some View {
        VStack {
            Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(dto.nivelEsperado == dto.qualRetangulo ? Color("Texto2") : .clear)
                .imageScale(.small)
                .padding(.top, 2)
            
            Rectangle()
                .fill(dto.cor)
                .border(dto.corBorda, width: 2)
                .frame(width: dto.tamanho[0], height: dto.tamanho[1])
        }
    }
}
