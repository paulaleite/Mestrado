//
//  SectionEstudantesDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Visualização dos Estudantes que foram adicionados na Disciplina.
struct SectionEstudantesDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    @State var selecao: Bool = true
    
    // MARK: - Body da View
    var body: some View {
        Section {
            NavigationLink {
                EmptyView()
            } label: {
                Text("Adicionar Estudantes")
                    .foregroundColor(Color.texto1)
                    .font(.body)
            }

        }
        
        if viewModel.estudantes.isEmpty {
            Section {
                HStack {
                    Toggle(isOn: $selecao) {
                        Text("")
                    }
                    .toggleStyle(.button)
                }
            } header: {
                HStack(spacing: 2) {
                    Text("*")
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    
                    Text("Titulo.Estudante.Plural".localized())
                        .textCase(.uppercase)
                        .font(.system(size: 14))
                        .foregroundColor(Color.texto2)
                    
                    Spacer()
                }
            }
        }

//        header: {
//            HStack(spacing: 2) {
//                Text("*")
//                    .foregroundColor(.red)
//                    .font(.system(size: 14))
//                    .fontWeight(.bold)
//
//                Text("Titulo.Estudante.Plural".localized())
//                    .textCase(.uppercase)
//                    .font(.system(size: 14))
//                    .foregroundColor(Color.texto2)
//
//                Spacer()
//            }
//        }

    }
}
