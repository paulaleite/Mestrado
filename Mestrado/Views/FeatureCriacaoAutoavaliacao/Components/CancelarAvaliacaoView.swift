//
//  CancelarAvaliacaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

struct CancelarAvaliacaoView: View {
    // MARK: - Variáveis e Constantes
    @Environment(\.dismiss) var dismiss
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
