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
    /// Estado que vai permitir manter o título correto do momento atual.
    @State var tituloAtual: String = ""
    /// Estado que vai permitir manter a data correta do momento atual.
    @State var dataSelecionada: Date = .now
    
    // MARK: - Body da View
    var body: some View {
        Section {
            MomentosAvaliativosDisciplinaCellView(tituloMomento: $tituloMomento, data: $data, tituloAtual: $tituloAtual, dataSelecionada: $dataSelecionada)
                .listRowBackground(Color.fundo2)
        } header: {
            SectionTituloObrigatorioView(titulo: "Titulo.Info.Momento.Avaliativo".localized())
        }
        
        if !viewModel.momentoAvaliativo.isEmpty {
            Section {
                MomentosAvaliativosDisciplinaListView(tituloMomento: $tituloAtual, data: $dataSelecionada)
                    .listRowBackground(Color.fundo2)
            } header: {
                Text("Titulo.Momento.Criado".localized())
                    .textCase(.uppercase)
                    .font(.system(size: 12))
                    .foregroundColor(Color.texto2)
            }
        }
    }
}

/// Visualização da Lista de Momentos Avaliativos criados pelo Professor, com seu título e data.
struct MomentosAvaliativosDisciplinaListView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
    // MARK: - Body da View
    var body: some View {
        ForEach(viewModel.momentoAvaliativo, id: \.self) { momento in
            NavigationLink {
                AdicionarObjetivosMomentoView(tituloMomento: $tituloMomento, data: $data)
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
                    
                    if momento.objetivos.count == 0 {
                        Text("Titulo.Objetivo.Adicionar".localized())
                            .foregroundColor(Color.texto2)
                            .font(.system(size: 17))
                    } else if momento.objetivos.count == 1 {
                        Text("\(momento.objetivos.count) " + "Titulo.Objetivo".localized())
                            .foregroundColor(Color.texto2)
                            .font(.system(size: 17))
                    } else {
                        Text("\(momento.objetivos.count) " + "Titulo.Objetivos.Plural".localized())
                            .foregroundColor(Color.texto2)
                            .font(.system(size: 17))
                    }
                }
                .padding(.vertical, 3)
            }
        }
    }
}

/// Célula de Criação do Momento Avaliativo da Disciplina.
struct MomentosAvaliativosDisciplinaCellView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: PostDisciplinaViewModel
    
    /// Binding que contém a String do título do momento avaliativo.
    @Binding var tituloMomento: String
    /// Binding que contém a Data selecionada.
    @Binding var data: Date
    
    /// Estado que vai permitir manter o título correto do momento atual.
    @Binding var tituloAtual: String
    /// Estado que vai permitir manter a data correta do momento atual.
    @Binding var dataSelecionada: Date
    
    // MARK: - Body da View
    var body: some View {
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
                if tituloMomento != "" {
                    viewModel.criarMomentoAvaliativo(titulo: tituloMomento, data: dataString)
                }
                tituloAtual = tituloMomento
                tituloMomento = ""
                dataSelecionada = data
                data = .now
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundColor(Color.corDeAcao)
            }
        }
    }
}
