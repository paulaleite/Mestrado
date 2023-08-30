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
    
    @StateObject var viewModel: AutoavaliacaoViewModel = AutoavaliacaoViewModel()
    
    /// Identificador único do estudante.
    var estudanteID: String
    /// Identificado único da disciplina
    var disciplinaID: String
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado: MomentoAvaliativoModel = MomentoAvaliativoModel(id: "", titulo: "Descricao.Momento.Selecao".localized())
    /// Estado que reflete o texto da reflexão do Estudante.
    @State var descricaoReflexao = ""
    /// Estado que reflete o sentimento selecionado pelo Estudante.
    @State var sentimentoSelecionado: Int = 4
    /// Estado que informa qual data está selecionada.
    @State var data = Date()
    /// Estado que informa se a solicitação ocorreu de forma incorreta.
    @State var mostrarErro: Bool = false
    
    var sentimentos: [Sentimento] = [.amei, .gostei, .indiferente, .naoGostei, .odiei]
    
    /// Título dos Momentos, tirados da ViewModel.
    var titulosMomentos: [String] {
        var titulos: [String] = []
        for momento in viewModel.momentos {
            titulos.append(momento.titulo)
        }
        return titulos
    }
    
    var objetivos: [ObjetivoAutoavaliacaoModel] {
        var objs: [ObjetivoAutoavaliacaoModel] = []
        
        for objetivo in viewModel.objetivos {
            if objetivo.momentoAvaliativo == momentoAvaliativoSelecionado.titulo {
                objs.append(objetivo)
            }
        }
        
        return objs
    }
    
    // MARK: - Body da View
    
    var body: some View {
        NavigationStack {
            if viewModel.estaBuscando {
                LoadingView()
            } else {
                Form {
                    MomentoSectionView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, data: $data, momentos: viewModel.momentos)
                    
                    ReflexaoSectionView(sentimentoSelecionado: $sentimentoSelecionado, descricaoReflexao: $descricaoReflexao, sentimentos: sentimentos)
                    
                    ObjetivosAvaliacaoSectionView(objetivos: objetivos)
                }
                .scrollContentBackground(.hidden)
                .background(Color.fundo1)
                .navigationTitle("Titulo.Autoavaliacao.Nova".localized())
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        CancelarAvaliacaoView()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        AdicionarAvaliacaoView(viewModel: viewModel, momentoAvaliativoSelecionado: momentoAvaliativoSelecionado, descricaoReflexao: descricaoReflexao, data: data.description, sentimentoSelecionado: sentimentoSelecionado, disciplinaID: disciplinaID, estudanteID: estudanteID, objetivos: objetivos)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getDadosCriacaoAutoavaliacao(estudanteID: estudanteID, disciplinaID: disciplinaID)
            }
            if viewModel.mensagemDeErro != nil {
                mostrarErro.toggle()
            }
        }
        .alert(isPresented: $mostrarErro) {
            Alert(title: Text(viewModel.mensagemDeErro!), message: Text("Alert.Mensagem.Erro".localized()), dismissButton:
                    .cancel(Text("Titulo.OK".localized())))
        }
        .environmentObject(viewModel)
    }
}
