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
