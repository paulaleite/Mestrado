//
//  GraficoProfessorSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualização que representa a Seção específica do Gráfico do Professor.
struct GraficoProfessorSectionView: View {
    var body: some View {
        Section {
            GraficoProfessorView()
                .padding()
                .listRowSeparator(.hidden)
            
            Text("Descricao.Grafico.Professor".localized())
                .font(.system(size: 12))
                .foregroundColor(Color.texto2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.fundo1)
                .listRowBackground(Color.fundo1)
                .padding(.horizontal, -20)
        } header: {
            Text("Titulo.Estatistica.Plural".localized())
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

struct GraficoProfessorSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GraficoProfessorSectionView()
    }
}
