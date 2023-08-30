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
            if objetivo.momentoAvaliativo == momentoAvaliativoSelecionado {
                objs.append(objetivo)
            }
        }
        
        return objs
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
                InformacoesAvaliacaoSectionView()
                
                MomentoSectionView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, data: $data, titulosMomentos: titulosMomentos)
                
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
                    AdicionarAvaliacaoView(momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado, descricaoReflexao: $descricaoReflexao)
                }
            }
        }
    }
}
