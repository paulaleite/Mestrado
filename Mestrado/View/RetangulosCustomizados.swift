//
//  RetangulosCustomizados.swift
//  Mestrado
//
//  Created by Paula Leite on 06/07/23.
//

import Foundation
import SwiftUI

struct RetanguloDTO {
    /// Representa a cor da Competência do Objetivo de Aprendizado
    var corCompetencia: Color
    /// Cor da borda do elemente deve ser .clear, para que não apareça a cor.
    var corBorda: Color = Color.clear
    /// A Rubrica escolhida pelo Estudante para o Objetivo de Aprendizado que está sendo aprensetado no elemento da lista, representada por um Int entre 0 e 5.
    var objetivoNivel: Int
    /// A Rubrica escolhida pelo Professor, que o Estudante precisa atingir até o final da Disciplina, representada por um Int entre 0 e 5.
    var nivelEsperado: Int
    /// Representa o tamanho do elemento retangular customizado de cada Rubrica.
    var tamanho: [CGFloat]
    /// Inteiro que representa se o retângulo arrendondado que está sendo criado é o da esquerda ou da direita.
    var qualRetangulo: Int
}

/// Elemento que representa o Retângulo Customizado Arredondado que é utilizado para criar a Visualização de Rubrica, podendo ser com o arrendondamento na esquerda, ou na direita.
struct RetanguloArrendado: View {
    // MARK: - Variáveis e Constantes
    var retanguloDTO: RetanguloDTO
    /// Caso o retangulo que será criado seja o da esquerda, ele será configurado utilizando essa variável opcional.
    var retanguloEsquerda: FormaBordaArrendondadoEsquerda?
    /// Caso o retangulo que será criado seja o da direita, ele será configurado utilizando essa variável opcional.
    var retanguloDireita: FormaBordaArrendondadoDireita?
    
    var body: some View {
        VStack {
            Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(retanguloDTO.nivelEsperado == retanguloDTO.qualRetangulo ? Color("Texto2") : .clear)
                .imageScale(.small)
                .padding(.top, 2)
            
            if let esquerda = retanguloEsquerda {
                Rectangle()
                    .fill(retanguloDTO.corCompetencia)
                    .overlay(esquerda.stroke(retanguloDTO.corBorda, lineWidth: 3.5))
                    .mask(esquerda)
                    .frame(width: retanguloDTO.tamanho[0], height: retanguloDTO.tamanho[1])
            }

            if let direita = retanguloDireita {
                Rectangle()
                    .fill(retanguloDTO.corCompetencia)
                    .overlay(direita.stroke(retanguloDTO.corBorda, lineWidth: 3.5))
                    .mask(direita)
                    .frame(width: retanguloDTO.tamanho[0], height: retanguloDTO.tamanho[1])
            }
        }
    }
}

/// Elemento que representa o Retângulo Customizado que é utilizado para criar a Visualização de Rubrica, sendo utilizado nos três elementos do meio, que não possuem arrendondamento.
struct RetanguloMeio: View {
    // MARK: - Variáveis e Constantes
    let retanguloDTO: RetanguloDTO
    
    var body: some View {
        VStack {
            Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(retanguloDTO.nivelEsperado == retanguloDTO.qualRetangulo ? Color("Texto2") : .clear)
                .imageScale(.small)
                .padding(.top, 2)
            
            Rectangle()
                .fill(retanguloDTO.corCompetencia)
                .border(retanguloDTO.corBorda, width: 2)
                .frame(width: retanguloDTO.tamanho[0], height: retanguloDTO.tamanho[1])
        }
    }
}
