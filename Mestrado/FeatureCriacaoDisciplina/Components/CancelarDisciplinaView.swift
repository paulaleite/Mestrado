//
//  CancelarDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Com essa visualização, é possível interagir com o botão de Cancelar a criação de uma disciplina e abrir o Alert de Confirmação.
struct CancelarDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    @Environment(\.dismiss) var dismiss
    
    /// Estado que permite aparecer o Alert de Cancelamento.
    @State var mostrarConfirmacao = false
    
    /// Título do Botão que aparece na navegação.
    var tituloBotao: String
    /// Título do Alert
    var tituloAlert: String
    /// Mensagem do Alert
    var mensageAlert: String
    /// Texto botão principal do Alert
    var tituloBotaoAlert: String
    /// Texto botão secundário do Alert
    var tituloBotaoSecundarioAlert: String
    /// Cor de ação
    var cor: Color
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarConfirmacao.toggle()
        } label: {
            Text(tituloBotao)
                .foregroundColor(cor)
        }
        .alert(isPresented: $mostrarConfirmacao) {
            Alert(title: Text(tituloAlert), message: Text(mensageAlert), primaryButton: .default(Text(tituloBotaoAlert)), secondaryButton: .destructive(Text(tituloBotaoSecundarioAlert)) {
                dismiss()
            })
        }
    }
}
