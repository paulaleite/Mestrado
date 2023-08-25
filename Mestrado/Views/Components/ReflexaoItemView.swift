//
//  ReflectionCellView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation
import SwiftUI


struct ReflexaoItemDTO {
    /// O sentimento configurado pelo estudante, do tipo Sentimento.
    let sentimento: Sentimento
    /// A data configurada pelo estudante, do tipo Date.
    let data: String
    /// A reflexão configurada pelo estudante, do tipo String.
    let reflexaoTexto: String
}

/// Configura o Item específico de uma Reflexão.
struct ReflexaoItemView: View {
    
    // MARK: - Variáveis e Constantes
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pela Reflexao Item DTO.
    let dto: ReflexaoItemDTO
    
    var data: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let resultado = dateFormatter.date(from: dto.data)!
        return resultado
    }
    
    // MARK: - Body da View
    var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .bottom) {
                Text(dto.sentimento.description)
                    .font(.title3)
                    .foregroundColor(Color("Texto1"))
                
                Spacer()
                
                Text(data, format: .dateTime.day().month().year())
                    .font(.caption2)
                    .foregroundColor(Color("Texto2"))
            }
            
            Text(dto.reflexaoTexto)
                .font(.body)
                .foregroundColor(Color("Texto1"))
        }
        .background(Color.fundo2)
    }
}
