//
//  AdicionarAvaliacaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct AdicionarAvaliacaoView: View {
    // MARK: - Variáveis e Constantes
    
    @Environment(\.dismiss) var dismiss
    
    /// Binding que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: String
    /// Binding que reflete o texto da reflexão do Estudante.
    @Binding var descricaoReflexao: String
    /// State que permite mostrar o Alert quando o botão de Concluído é selecionado.
    @State var mostrarAlert = false
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarAlert.toggle()
        } label: {
            Text("Titulo.Concluido".localized())
                .foregroundColor((momentoAvaliativoSelecionado == "Descricao.Momento.Selecao".localized() || descricaoReflexao.isEmpty) ? Color.texto2 : Color.corDeAcao)
        }
        .disabled((momentoAvaliativoSelecionado == "Descricao.Momento.Selecao".localized() || descricaoReflexao.isEmpty) ? true : false)
        .alert(isPresented: $mostrarAlert) {
            Alert(title: Text("Alert.Titulo.Avaliacao.Adicionar".localized()), message: Text("Alert.Mensagem.Avaliacao.Adicionar".localized()), primaryButton: .default(Text("Titulo.Editar".localized())), secondaryButton: .default(Text("Titulo.Salvar".localized())) {
                dismiss()
                // Salvar dados!
            })
        }
    }
}
