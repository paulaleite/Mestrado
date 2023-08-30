//
//  MomentoSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 29/08/23.
//

import SwiftUI

/// Com essa visualização, é possível estruturar a Section do Momento Avaliativo que será utilizada durante a Autoavaliação.
struct MomentoSectionView: View {
    // MARK: - Variáveis e Constantes
    /// Estado que informa qual momento avaliativo está selecionado
    @Binding var momentoAvaliativoSelecionado: MomentoAvaliativoModel
    /// Estado que informa qual data está selecionada.
    @Binding var data: Date
    
    var momentos: [MomentoAvaliativoModel]
    
    // MARK: - Body da View
    var body: some View {
        Section {
            MomentosAvaliativosView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, momentos: momentos)
                .listRowBackground(Color.fundo2)
            
            DataCellView(data: $data)
                .listRowBackground(Color.fundo2)
        } header: {
            HStack(spacing: 2) {
                Text("Titulo.Momento".localized())
                    .textCase(.uppercase)
                    .font(.system(size: 14))
                
                Text("*")
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
    }
}
