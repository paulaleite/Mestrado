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
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Button {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let dataString = dateFormatter.string(from: data)
                    viewModel.criarMomentoAvaliativo(titulo: tituloMomento, data: dataString)
                    tituloMomento = ""
                    data = .now
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color.corDeAcao)
                }
            }
        } header: {
            HStack(spacing: 2) {
                Text("*")
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                
                Text("Titulo.Info.Momento.Avaliativo".localized())
                    .textCase(.uppercase)
                    .font(.system(size: 14))
                    .foregroundColor(Color.texto2)
                
                Spacer()
            }
        }
        
        if !viewModel.momentoAvaliativo.isEmpty {
            Section {
                ForEach(viewModel.momentoAvaliativo, id: \.self) { momento in
                    NavigationLink {
    //                        ObjetivosMomentoView()
                        EmptyView()
                    } label: {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text(momento.titulo)
                                    .foregroundColor(Color.texto1)
                                    .font(.system(size: 17))
                                
                                Text(momento.data)
                                    .foregroundColor(Color.texto2)
                                    .font(.system(size: 13))
                            }
                            
                            Spacer()
                            
                            Text("Adicionar algo")
                                .foregroundColor(Color.texto2)
                                .font(.system(size: 17))
                        }
                        .padding(.vertical, 3)
                    }
                }
            } header: {
                Text("Titulo.Momento.Criado".localized())
                    .textCase(.uppercase)
                    .font(.system(size: 14))
                    .foregroundColor(Color.texto2)
            }
        }
    }
}
