//
//  VisaoGeralSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização que representa a Seção específica da Visão Geral do Professor.
struct VisaoGeralSectionView: View {
    // MARK: - Variáveis e Constantes
    
    /// Binding que permite saber qual Filtro está selecionado
    @Binding var filtro: String
    
    /// Nome dos filtros
    var tituloFiltros: [String] = ["Titulo.Todos".localized(), "Titulo.Sem.Avaliacao".localized(), "Titulo.Abaixo.Nivel".localized(), "Titulo.Acima.Nivel".localized()]
    
    // MARK: - Body da View
    var body: some View {
        Section {
            Picker("Titulo.VisaoGeral".localized(), selection: $filtro) {
                ForEach(tituloFiltros, id: \.self) {
                    Text($0)
                        .font(.system(size: 11))
                }
            }
            .pickerStyle(.segmented)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.fundo1)
            .padding(.horizontal, -20)
            
            InfoFiltroView(filtro: $filtro)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.fundo1)
                .padding(.horizontal, -16)
            
            EstudantesFiltroView(filtro: $filtro)
                .listRowBackground(Color.fundo2)
        } header: {
            Text("Titulo.VisaoGeral".localized())
                .font(.title.bold())
                .foregroundColor(Color.texto1)
                .textCase(.none)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.fundo1)
                .padding(.horizontal, -20)
        }
    }
}
