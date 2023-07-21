//
//  +Color.swift
//  Mestrado
//
//  Created by Paula Leite on 05/07/23.
//

import Foundation
import SwiftUI

extension Color {
    // MARK: - Inicializadores
    
    /// Inicializador que permite que uma cor seja criada a partir de um array que contenha um código HEX. Não deve-se colocar a "#".
    /// Exemplo: Color(hex: "ffffff")
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (alpha, red, green, blue) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
    
    // MARK: - Variáveis e Constantes
    
    /// Cor de ação primária do aplicativo.
    static var corDeAcao: Color? = {
        Color("Acao1")
    }()
    
    /// Cor que representa a primeira competência dos objetivos de aprendizado.
    static var competencia1: Color? = {
       Color("Competencia1")
    }()
    
    /// Cor que representa a segunda competência dos objetivos de aprendizado.
    static var competencia2: Color? = {
       Color("Competencia2")
    }()
    
    /// Cor que representa a terceira competência dos objetivos de aprendizado.
    static var competencia3: Color? = {
       Color("Competencia3")
    }()
    
    /// Cor que representa a quarta competência dos objetivos de aprendizado.
    static var competencia4: Color? = {
       Color("Competencia4")
    }()
    
    /// Cor que representa o fundo primário do aplicativo.
    static var fundo1: Color? = {
       Color("Fundo1")
    }()
    
    /// Cor que representa o fundo secundário do aplicativo.
    static var fundo2: Color? = {
       Color("Fundo2")
    }()
    
    /// Cor que representa o fundo terciário do aplicativo.
    static var fundo3: Color? = {
       Color("Fundo3")
    }()
    
    /// Cor que representa o fundo quaternário do aplicativo.
    static var fundo4: Color? = {
       Color("Fundo4")
    }()
    
    /// Cor utilizada nos textos primários do aplicativo.
    static var texto1: Color? = {
       Color("Texto1")
    }()
    
    /// Cor utilizada nos textos secundários do aplicativo.
    static var texto2: Color? = {
       Color("Texto2")
    }()
    
    /// Cor utilizada nos textos terciários do aplicativo.
    static var texto3: Color? = {
       Color("Texto3")
    }()
}
