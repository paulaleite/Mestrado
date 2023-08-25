//
//  FiltroMomentos.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

struct FiltroMomentosDTO {
    /// Lista de Momentos Avaliativos da Disciplina do Estudante.
    var titulos: [String]
}

struct FiltroMomentos: View {
    // MARK: - Variáveis e Constantes
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pelo DTO do Filtro do Momento.
    var dto: FiltroMomentosDTO
    
    /// Estado que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: String
    
    // MARK: - Body da View
    var body: some View {
        Menu {
            Menu {
                Picker("Filtrar por", selection: $momentoAvaliativoSelecionado) {
                    ForEach(dto.titulos, id: \.self) {
                        Text($0)
                    }
                }
            } label: {
                HStack {
                    Text("Titulo.Filtro".localized() + "\n" + momentoAvaliativoSelecionado)
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .font(.body)
                .foregroundColor(Color.corDeAcao)
        }
    }
}
