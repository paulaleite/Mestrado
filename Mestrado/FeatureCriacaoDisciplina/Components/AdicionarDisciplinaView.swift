//
//  AdicionarDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

struct AdcDisciplinaDTO {
    /// Título da Disciplina
    var tituloDisciplina: String
    /// Momento Avaliativos criados para a Disciplina.
    var momentosAvaliativos: [MomentoAvaliativoPostDisciplinaModel]
    /// Os estudantes que fazem parte da Disciplina.
    var estudantes: [EstudantePostDisciplinaModel]
}

/// Com essa visualização, é possível interagir com o botão de Criar uma Disciplina, chamando o Alert de Confirmação.
struct AdicionarDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pelo DTO de Adicionar Avaliação.
    var dto: AdcDisciplinaDTO
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// State que permite mostrar o Alert quando o botão de Concluído é selecionado.
    @State var mostrarAlert = false
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarAlert.toggle()
        } label: {
            Text("Titulo.Concluido".localized())
                .foregroundColor((dto.tituloDisciplina == "" || dto.momentosAvaliativos.isEmpty || dto.estudantes.isEmpty) ? Color.texto2 : Color.corDeAcao)
        }
        .disabled((dto.tituloDisciplina == "" || dto.momentosAvaliativos.isEmpty || dto.estudantes.isEmpty) ? true : false)
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
