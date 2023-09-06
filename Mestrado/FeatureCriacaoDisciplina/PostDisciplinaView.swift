//
//  PostDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

/// Com essa visualização, o Professor consegue construir uma Disciplina nova.
struct PostDisciplinaView: View {
    // MARK: - Variáveis e Constantes
    @StateObject var viewModel: PostDisciplinaViewModel = PostDisciplinaViewModel()
    
    /// Estado que contém a String do título da disciplina.
    @State var tituloDisciplina: String = ""
    /// Estado que contém a String do título do momento avaliativo.
    @State var tituloMomento: String = ""
    /// Estado que contém a Data selecionada.
    @State var data: Date = .now
    /// Estado que informa se a solicitação ocorreu de forma incorreta.
    @State var mostrarErro: Bool = false
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            Form {
                SectionTituloDisciplinaView(tituloDisciplina: $tituloDisciplina)
                SectionMomentosAvaliativosDisciplinaView(tituloMomento: $tituloMomento, data: $data)
                SectionEstudantesDisciplinaView()
            }
            .scrollContentBackground(.hidden)
            .background(Color.fundo1)
            .navigationTitle("Titulo.Disciplina.Nova".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CancelarDisciplinaView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    AdicionarDisciplinaView(dto: AdcDisciplinaDTO(tituloDisciplina: tituloDisciplina))
                }
            }
        }
        .environmentObject(viewModel)
        .onAppear {
            if viewModel.mensagemDeErro != nil {
                mostrarErro.toggle()
            }
        }
        .alert(isPresented: $mostrarErro) {
            Alert(title: Text(viewModel.mensagemDeErro!), message: Text("Alert.Mensagem.Erro".localized()), dismissButton:
                    .cancel(Text("Titulo.OK".localized())))
        }
    }
}
