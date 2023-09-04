//
//  SectionMomentosAvaliativosDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Visualização da Section dos Momentos Avaliativos.
struct SectionMomentosAvaliativosDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
//    var momentosAvaliativos: []
    
    // MARK: - Body da View
    var body: some View {
        Section {
            HStack {
                VStack {
                    TextField("Titulo.Momento.Avaliativo".localized(), text: $tituloMomento, axis: .vertical)
                        .listRowBackground(Color.fundo2)
                    
                    DataCellView(data: $data)
                }
                
                Image(systemName: "plus.circle")
            }
            
            Section {
                
            }
        } header: {
            Text("Titulo.Momento.Avaliativo.Plural".localized())
                .textCase(.uppercase)
                .font(.system(size: 14))
                .foregroundColor(Color.texto2)
        }

    }
}
