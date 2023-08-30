//
//  AdicionarAvaliacaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct AdcAvaliacaoDTO {
    /// O momento avaliativo está selecionado
    var momentoAvaliativoSelecionado: MomentoAvaliativoModel
    /// O texto da reflexão do Estudante.
    var descricaoReflexao: String
    /// A data selecionada pelo Estudante.
    var data: String
    /// O sentimento selecionado pelo Estudante.
    var sentimentoSelecionado: Int
    /// O identificador único da Disciplina selecionada.
    var disciplinaID: String
    /// O identificador único do Estudante.
    var estudanteID: String
    /// A lista de Objetivos do momento avaliativo.
    var objetivos: [ObjetivoAutoavaliacaoModel]
}

/// Com essa visualização, é possível interagir com o botão de Criar uma Autoavaliação, chamando o Alert de Confirmação.
struct AdicionarAvaliacaoView: View {
    // MARK: - Variáveis e Constantes
    
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pelo DTO de Adicionar Avaliação.
    var dto: AdcAvaliacaoDTO
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: AutoavaliacaoViewModel
    
    /// State que permite mostrar o Alert quando o botão de Concluído é selecionado.
    @State var mostrarAlert = false
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarAlert.toggle()
        } label: {
            Text("Titulo.Concluido".localized())
                .foregroundColor((dto.momentoAvaliativoSelecionado.titulo == "Descricao.Momento.Selecao".localized() || dto.descricaoReflexao.isEmpty) ? Color.texto2 : Color.corDeAcao)
        }
        .disabled((dto.momentoAvaliativoSelecionado.titulo == "Descricao.Momento.Selecao".localized() || dto.descricaoReflexao.isEmpty) ? true : false)
        .alert(isPresented: $mostrarAlert) {
            Alert(title: Text("Alert.Titulo.Avaliacao.Adicionar".localized()), message: Text("Alert.Mensagem.Avaliacao.Adicionar".localized()), primaryButton: .default(Text("Titulo.Editar".localized())), secondaryButton: .default(Text("Titulo.Salvar".localized())) {
                dismiss()
                viewModel.atualizarAutoavaliacao(estudanteID: dto.estudanteID, momentoID: dto.momentoAvaliativoSelecionado.id, data: dto.data, sentimento: dto.sentimentoSelecionado, descricao: dto.descricaoReflexao, objetivos: dto.objetivos)
                Task {
                    if let autoavaliacao = viewModel.autoavaliacao {
                        await viewModel.postDadosAutoavaliacao(autoavaliacao: autoavaliacao, disciplinaID: dto.disciplinaID)
                    }
                }
            })
        }
    }
}
