//
//  InformacoesAvaliacaoSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct InformacoesAvaliacaoSectionView: View {
    var body: some View {
        Section {
            Text("Descricao.Salvar".localized())
                .font(.system(size: 11))
                .foregroundColor(Color.texto2)
                .listRowBackground(Color.fundo1)
                .padding(.horizontal, -16)
        } header: {
            Text("Titulo.Informações".localized())
                .textCase(.uppercase)
                .font(.system(size: 14))
        }
    }
}
