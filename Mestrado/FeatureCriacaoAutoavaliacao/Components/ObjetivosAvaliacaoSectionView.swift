//
//  ObjetivosAvaliacaoSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

/// Com essa visualização, é feita a estruturação da Section de Objetivos de Aprendizado da Autoavaliação.
struct ObjetivosAvaliacaoSectionView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: AutoavaliacaoViewModel
    
    /// Objetivos disponíveis.
    var objetivos: [ObjetivoAutoavaliacaoModel]
    
    // MARK: - Body da View
    var body: some View {
        Section {
            if objetivos.isEmpty {
                Text("Descricao.Momento.Nao.Selecao".localized())
                    .font(.system(size: 11))
                    .foregroundColor(Color.texto2)
                    .listRowBackground(Color.fundo1)
                    .padding(.horizontal, -16)
            } else {
                ForEach(objetivos, id: \.self) { objetivo in
                    ObjetivoSelecaoItemView(dto: ObjetivoSelecaoItemDTO(corCompetencia: Color(objetivo.corCompetencia), descricao: objetivo.descricao, rubricaEstudante: objetivo.rubricaSelecionada, objetivoID: objetivo.id))
                }
            }
        } header: {
            Text("Titulo.Objetivo.Plural".localized())
                .textCase(.uppercase)
                .font(.system(size: 14))
        }
        .onAppear {
            viewModel.criarObjetivos(objetivos: objetivos)
        }
    }
}
