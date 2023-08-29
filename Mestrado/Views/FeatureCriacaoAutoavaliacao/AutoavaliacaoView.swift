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
    @State var momentoAvaliativoSelecionado = "Descricao.Momento.Selecao".localized()
    /// Estado que reflete o texto da reflexão do Estudante.
    @State var descricaoReflexao = ""
    /// Estado que reflete o sentimento selecionado pelo Estudante.
    @State var sentimentoSelecionado: Int = 4
    /// Estado que informa qual data está selecionada.
    @State private var data = Date()
    
    var sentimentos: [Sentimento] = [.amei, .gostei, .indiferente, .naoGostei, .odiei]
    
    var titulosMomentos: [String] {
        var titulos: [String] = []
        for momento in viewModel.momentos {
            titulos.append(momento.titulo)
        }
        return titulos
    }
    
    // MARK: - Inicializadores
    
    init(estudanteID: String, disciplinaID: String) {
        viewModel.estudanteID = estudanteID
        viewModel.disciplinaID = disciplinaID
    }
    
    // MARK: - Body da View
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    MomentosAvaliativosView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, titulosMomentos: titulosMomentos)
                        .listRowBackground(Color.fundo2)
                    
                    DataCellView(data: $data)
                        .listRowBackground(Color.fundo2)
                } header: {
                    Text("Titulo.Momento".localized())
                        .textCase(.uppercase)
                        .font(.system(size: 14))
                }
                
                SentimentosSectionView(sentimentoSelecionado: $sentimentoSelecionado, descricaoReflexao: $descricaoReflexao, sentimentos: sentimentos)
                
                Section {
                    ForEach(viewModel.objetivos, id: \.self) { objetivo in
                        ObjetivoSelecaoItemView(dto: ObjetivoSelecaoItemDTO(corCompetencia: Color(objetivo.corCompetencia), descricao: objetivo.descricao, rubricaEstudante: objetivo.rubricaSelecionada))
                    }
                } header: {
                    Text("Titulo.Objetivo.Plural".localized())
                        .textCase(.uppercase)
                        .font(.system(size: 14))
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
