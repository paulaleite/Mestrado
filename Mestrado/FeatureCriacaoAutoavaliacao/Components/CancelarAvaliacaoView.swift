//
//  CancelarAvaliacaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

/// Com essa visualização, é possível interagir com o botão de Cancelar a criação de uma autoavaliação e abrir o Alert de Confirmação.
struct CancelarAvaliacaoView: View {
    // MARK: - Variáveis e Constantes
    @Environment(\.dismiss) var dismiss
    
    /// Estado que permite aparecer o Alert de Cancelamento.
    @State var mostrarConfirmacao = false
    
    // MARK: - Body da View
    var body: some View {
        Button {
            mostrarConfirmacao.toggle()
        } label: {
            Text("Titulo.Cancelar".localized())
                .foregroundColor(.red)
        }
        .alert(isPresented: $mostrarConfirmacao) {
            Alert(title: Text("Alert.Titulo.Avaliacao.Cancelar".localized()), message: Text("Alert.Mensagem.Avaliacao.Cancelar".localized()), primaryButton: .default(Text("Titulo.Manter".localized())), secondaryButton: .destructive(Text("Titulo.Descartar".localized())) {
                dismiss()
            })
        }
    }
}
