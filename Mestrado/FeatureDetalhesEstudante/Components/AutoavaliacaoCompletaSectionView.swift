//
//  ObjetivosTodosSectionView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização da Section dos Objetivos não avaliados Estudante.
struct AutoavaliacaoCompletaSectionView: View {
    
    // MARK: - Variáveis e Constantes
    
    @EnvironmentObject var viewModel: EstudanteDetalhesViewModel
    
    /// Todos os Objetivos de Aprendizado, filtrados de acordo com o Momento Avaliativo selecionado.
    var objetivos: [ObjetivoEstudanteInfoModel] {
        if momentoAvaliativoSelecionado == "Titulo.Momentos.Todos".localized() {
            return viewModel.objetivos
        } else {
            return viewModel.objetivos.filter {
                $0.momentoAvaliativo.contains(momentoAvaliativoSelecionado)
            }
        }
    }
    
    /// Todas as Reflexões do Estudante, filtradas de acordo com o Momento Avaliativo selecionado.
    var reflexoes: [ReflexaoEstudanteInfoModel] {
        if momentoAvaliativoSelecionado == "Titulo.Momentos.Todos".localized() {
            return viewModel.reflexoes
        } else {
            return viewModel.reflexoes.filter {
                $0.momentoAvaliativo.contains(momentoAvaliativoSelecionado)
            }
        }
    }
    
    /// Estados que representam se as Seções de Reflexão e Objetivos estão expandidas.
    @State var sectionReflexoesExpandida: Bool = true
    @State var sectionObjetivosExpandida: Bool = true
    @State var sectionMomentosExpandida: Bool = true
    
    var dto: FiltroMomentosDTO
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    // MARK: - Body da View
    var body: some View {
        
        HStack {
            Text(momentoAvaliativoSelecionado)
                .textCase(.uppercase)
                .font(.system(size: 14))
                .foregroundColor(Color.texto2)
            
            Spacer()
            
            FiltroMomentos(dto: FiltroMomentosDTO(titulos: dto.titulos), momentoAvaliativoSelecionado: $momentoAvaliativoSelecionado)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.fundo1)
        .padding(.bottom, -20)
        
        Section {
            if sectionReflexoesExpandida && reflexoes.count > 0 {
                ForEach(reflexoes, id: \.self) { reflexao in
                    ReflexaoItemView(dto: ReflexaoItemDTO(sentimento: reflexao.sentimento, data: reflexao.data, descricao: reflexao.descricao))
                        .listRowBackground(Color.fundo2)
                }
            }
        } header: {
            SectionHeaderView(dto: SectionHeaderDTO(titulo: "Titulo.Reflexao.Plural".localized(), quantidade: reflexoes.count), sectionExpandida: $sectionReflexoesExpandida)
                .padding(.top, -20)
        }
        
        Section {
            if sectionObjetivosExpandida && objetivos.count > 0 {
                ForEach(objetivos, id: \.self) { objetivo in
                    ObjetivoItemView(dto: ObjetivoItemDTO(corCompetencia: Color(objetivo.corCompetencia), descricao: objetivo.descricao, rubricaSelecionada: objetivo.rubricaSelecionada, nivelEsperado: objetivo.nivelEsperado))
                        .listRowBackground(Color.fundo2)
                        .background(Color.fundo2)
                }
            }
        } header: {
            SectionHeaderView(dto: SectionHeaderDTO(titulo: "Titulo.Objetivo.Plural".localized(), quantidade: objetivos.count), sectionExpandida: $sectionObjetivosExpandida)
                .padding(.top, -20)
        }
    }
}
