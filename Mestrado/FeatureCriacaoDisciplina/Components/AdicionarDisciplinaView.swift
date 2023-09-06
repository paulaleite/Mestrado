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
                .foregroundColor((dto.tituloDisciplina == "" || viewModel.momentoAvaliativo.isEmpty || viewModel.estudantes.isEmpty) ? Color.texto2 : Color.corDeAcao)
        }
        .disabled((dto.tituloDisciplina == "" || viewModel.momentoAvaliativo.isEmpty || viewModel.estudantes.isEmpty) ? true : false)
        .alert(isPresented: $mostrarAlert) {
            Alert(title: Text("Alert.Titulo.Disciplina.Adicionar".localized()), message: Text("Alert.Mensagem.Disciplina.Adicionar".localized()), primaryButton: .default(Text("Titulo.Editar".localized())), secondaryButton: .default(Text("Titulo.Salvar".localized())) {
                dismiss()
                viewModel.atualizarDisciplina(titulo: dto.tituloDisciplina)
                Task {
                    if let disciplina = viewModel.disciplina {
                        await viewModel.postDadosCriacaoDisciplina(dados: PostDisciplinaModel(titulo: disciplina.titulo, momentoAvaliativo: disciplina.momentoAvaliativo, estudantes: disciplina.estudantes))
                    }
                }
            })
        }
    }
}
