//
//  SectionMomentosAvaliativosDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Visualização da Section dos Momentos Avaliativos.
struct SectionMomentosAvaliativosDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
    @State var momentosAvaliativos: [MomentoAvaliativoPostDisciplinaModel] = []
    
    // MARK: - Body da View
    var body: some View {
        Section {
            HStack {
                VStack {
                    TextField("Titulo.Momento.Avaliativo".localized(), text: $tituloMomento, axis: .vertical)
                        .listRowBackground(Color.fundo2)
                    
                    DataCellView(data: $data)
                }
                
                Button {
                    if tituloMomento != "" {
                        momentosAvaliativos.append(MomentoAvaliativoPostDisciplinaModel(titulo: tituloMomento, data: data.description, objetivos: []))
                    }
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color.corDeAcao)
                }
            }
            
            Section {
                ForEach(momentosAvaliativos, id: \.self) { momento in
                    NavigationLink {
//                        ObjetivosMomentoView()
                        EmptyView()
                    } label: {
                        HStack(alignment: .center) {
                            VStack {
                                Text(momento.titulo)
                                    .foregroundColor(Color.texto1)
                                    .font(.system(size: 17))
                                
                                Text(formatarData(data: momento.data), format: .dateTime.day().month().year())
                                    .foregroundColor(Color.texto2)
                                    .font(.system(size: 13))
                            }
                            
                            Text("Adicionar algo")
                                .foregroundColor(Color.texto2)
                                .font(.system(size: 17))
                        }
                    }
                }
            }
        } header: {
            Text("Titulo.Momento.Avaliativo.Plural".localized())
                .textCase(.uppercase)
                .font(.system(size: 14))
                .foregroundColor(Color.texto2)
        }
    }
    
    func formatarData(data: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let resultado = dateFormatter.date(from: data)!
        return resultado
    }
}
