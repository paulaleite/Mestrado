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
    
    @ObservedObject var viewModel: AutoavaliacaoViewModel
    
    /// Binding que informa qual momento avaliativo está selecionado
    var momentoAvaliativoSelecionado: MomentoAvaliativoModel
    /// Binding que reflete o texto da reflexão do Estudante.
    var descricaoReflexao: String
    /// Binding que reflete a data selecionada pelo Estudante.
    var data: String
    /// Estado que reflete o sentimento selecionado pelo Estudante.
    var sentimentoSelecionado: Int
    /// State que permite mostrar o Alert quando o botão de Concluído é selecionado.
    @State var mostrarAlert = false
    
    var disciplinaID: String
    var estudanteID: String
    var objetivos: [ObjetivoAutoavaliacaoModel]
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarAlert.toggle()
        } label: {
            Text("Titulo.Concluido".localized())
                .foregroundColor((momentoAvaliativoSelecionado.titulo == "Descricao.Momento.Selecao".localized() || descricaoReflexao.isEmpty) ? Color.texto2 : Color.corDeAcao)
        }
        .disabled((momentoAvaliativoSelecionado.titulo == "Descricao.Momento.Selecao".localized() || descricaoReflexao.isEmpty) ? true : false)
        .alert(isPresented: $mostrarAlert) {
            Alert(title: Text("Alert.Titulo.Avaliacao.Adicionar".localized()), message: Text("Alert.Mensagem.Avaliacao.Adicionar".localized()), primaryButton: .default(Text("Titulo.Editar".localized())), secondaryButton: .default(Text("Titulo.Salvar".localized())) {
                dismiss()
                viewModel.atualizarAutoavaliacao(estudanteID: estudanteID, momentoID: momentoAvaliativoSelecionado.id, data: data, sentimento: sentimentoSelecionado, descricao: descricaoReflexao, objetivos: objetivos)
                Task {
                    if let autoavaliacao = viewModel.autoavaliacao {
                        await viewModel.postDadosAutoavaliacao(autoavaliacao: autoavaliacao, disciplinaID: disciplinaID)
                    }
                }
            })
        }
    }
}
