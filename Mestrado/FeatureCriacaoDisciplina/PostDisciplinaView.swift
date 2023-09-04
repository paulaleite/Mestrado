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
    
    // MARK: - Body da View
    var body: some View {
        Form {
            SectionTituloDisciplinaView(tituloDisciplina: $tituloDisciplina)
            SectionMomentosAvaliativosDisciplinaView(tituloMomento: $tituloMomento, data: $data)
            SectionEstudantesDisciplinaView()
        }
        .environmentObject(viewModel)
        .navigationTitle("Titulo.Disciplina.Nova".localized())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CancelarDisciplinaView()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
//                AdicionarDisciplinaView(dto: AdcDisciplinaDTO())
            }
        }
    }
}
