//
//  AutoavaliacaoEstudanteCriacaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

/// Com essa visualização, o Estudante consegue construir uma autoavaliação, informando a data, reflexão e o nível nos objetivos.
struct AutoavaliacaoView: View {
    // MARK: - Constantes e Variáveis
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: AutoavaliacaoViewModel = AutoavaliacaoViewModel()
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = ""
    
    /// Estado que informa qual data está selecionada.
    @State private var data = Date()
    
    // MARK: - Inicializadores
    
    init(estudanteID: String, disciplinaID: String) {
        viewModel.estudanteID = estudanteID
        viewModel.disciplinaID = disciplinaID
    }
    
    // MARK: - Body da View
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        MomentosAvaliativosView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, momentos: viewModel.momentos)
                    } label: {
                        MomentoCellView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
                    }
                    
                    DataCellView(data: $data)
                } header: {
                    Text("Titulo.Momento".localized())
                }

            }
            .navigationTitle("Titulo.Autoavaliacao.Nova".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                        // TODO: Chamar pop-up
                    } label: {
                        Text("Titulo.Cancelar".localized())
                            .foregroundColor(.red)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                        // TODO: Chamar pop-up
                    } label: {
                        Text("Titulo.Concluido".localized())
                            .foregroundColor(Color.texto1)
                    }
                }
        }
        }
    }
}
