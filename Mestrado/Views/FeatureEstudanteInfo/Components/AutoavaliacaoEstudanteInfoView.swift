//
//  AutoavaliacaoEstudanteView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

/// Visualização das Informações das Autoavaliações do Estudante. Com ela, é possível visualizar todas as reflexões feitas até o presente Momento, bem como todos os Objetivos de Aprendizado e o níveis selecionados.
struct AutoavaliacaoEstudanteInfoView: View {
    
    // MARK: - Variáveis e Constantes
    
    @ObservedObject var viewModel: EstudanteInfoViewModel
    
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
    
    /// Binding que informa qual momento avaliativo está selecionado.
    @Binding var momentoAvaliativoSelecionado: String
    
    // MARK: - Body da View
    var body: some View {
        List {
            Section {
                if sectionReflexoesExpandida && reflexoes.count > 0 {
                    ForEach(reflexoes, id: \.self) { reflexao in
                        ReflexaoItemView(dto: ReflexaoItemDTO(sentimento: reflexao.sentimento, data: reflexao.data, descricao: reflexao.descricao))
                    }
                }
            } header: {
                SectionHeaderView(dto: SectionHeaderDTO(titulo: "Titulo.Reflexao.Plural".localized(), quantidade: reflexoes.count), sectionExpandida: $sectionReflexoesExpandida)
            }
            
            Section {
                if sectionObjetivosExpandida && objetivos.count > 0 {
                    ForEach(objetivos, id: \.self) { objetivo in
                        ObjetivoItemView(dto: ObjetivoItemDTO(corCompetencia: Color(objetivo.corCompetencia), descricao: objetivo.descricao, rubricaSelecionada: objetivo.rubricaSelecionada, nivelEsperado: objetivo.nivelEsperado))
                    }
                }
            } header: {
                SectionHeaderView(dto: SectionHeaderDTO(titulo: "Titulo.Objetivo.Pural".localized(), quantidade: objetivos.count), sectionExpandida: $sectionObjetivosExpandida)
            }
        }
        .background(Color.fundo1)
        
    }
}
