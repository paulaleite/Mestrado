//
//  RetangulosCustomizados.swift
//  Mestrado
//
//  Created by Paula Leite on 06/07/23.
//

import Foundation
import SwiftUI

struct RetanguloArrendadoEsquerda: View {
    var cor: Color
    var corBorda: Color = Color.clear
    var tamanho: [CGFloat]
    var nivelEsperado: Double
    
    var body: some View {
        let path = FormaBordaArrendondadoEsquerda(raio: 4)
        
        if nivelEsperado == 1 {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Texto2"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .overlay(path.stroke(corBorda, lineWidth: 3.5))
                    .mask(path)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        } else {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Fundo1"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .overlay(path.stroke(corBorda, lineWidth: 3.5))
                    .mask(path)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        }
        
    }
}


struct RetanguloMeio1: View {
    var cor: Color
    var corBorda: Color = Color.clear
    var tamanho: [CGFloat]
    var nivelEsperado: Double
    
    var body: some View {
        if nivelEsperado == 2 {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Texto2"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .border(corBorda, width: 2)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        } else {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Fundo1"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .border(corBorda, width: 2)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        }
    }
}

struct RetanguloMeio2: View {
    var cor: Color
    var corBorda: Color = Color.clear
    var tamanho: [CGFloat]
    var nivelEsperado: Double
    
    var body: some View {
        if nivelEsperado == 3 {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Texto2"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .border(corBorda, width: 2)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        } else {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Fundo1"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .border(corBorda, width: 2)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        }
    }
}

struct RetanguloMeio3: View {
    var cor: Color
    var corBorda: Color = Color.clear
    var tamanho: [CGFloat]
    var nivelEsperado: Double
    
    var body: some View {
        if nivelEsperado == 4 {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Texto2"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .border(corBorda, width: 2)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        } else {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Fundo1"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .border(corBorda, width: 2)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        }
    }
}

struct RetanguloArrendadoDireita: View {
    var cor: Color
    var corBorda: Color = Color.clear
    var tamanho: [CGFloat]
    var nivelEsperado: Double
    
    var body: some View {
        let path = FormaBordaArrendondadoDireita(raio: 4)
        
        if nivelEsperado == 5 {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Texto2"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .overlay(path.stroke(corBorda, lineWidth: 3.5))
                    .mask(path)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        } else {
            VStack {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color("Fundo1"))
                    .imageScale(.small)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(cor)
                    .overlay(path.stroke(corBorda, lineWidth: 3.5))
                    .mask(path)
                    .frame(width: tamanho[0], height: tamanho[1])
            }
        }
    }
}
