//
//  InfoFiltro.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

/// Visualização que informa o Professor do significado do filtro que está sendo acessado.
struct InfoFiltroView: View {
    // MARK: - Variáveis e Constantes
    @EnvironmentObject var viewModel: ProfessorInfoViewModel
    
    /// Binding que permite saber qual Filtro está selecionado
    @Binding var filtro: String
    
    /// Texto do título
    var titulo: String {
        var t: String = ""
        
        if filtro == "Titulo.Todos".localized() {
            if viewModel.estudantesFiltro1.count == 1 {
                t = "\(viewModel.estudantesFiltro1.count) " + "Titulo.Filtro.Todos.Singular".localized()
            } else {
                t = "\(viewModel.estudantesFiltro1.count) " + "Titulo.Filtro.Todos.Plural".localized()
            }
        } else if filtro == "Titulo.Sem.Avaliacao".localized() {
            if viewModel.estudantesFiltro2.count == 1 {
                t = "\(viewModel.estudantesFiltro2.count) " + "Titulo.Filtro.Sem.Avaliacao.Singular".localized()
            } else {
                t = "\(viewModel.estudantesFiltro2.count) " + "Titulo.Filtro.Sem.Avaliacao.Plural".localized()
            }
        } else if filtro == "Titulo.Abaixo.Nivel".localized() {
            if viewModel.estudantesFiltro3.count == 1 {
                t = "\(viewModel.estudantesFiltro3.count) " + "Titulo.Filtro.Abaixo.Nivel.Singular".localized()
            } else {
                t = "\(viewModel.estudantesFiltro3.count) " + "Titulo.Filtro.Abaixo.Nivel.Plural".localized()
            }
        } else {
            if viewModel.estudantesFiltro4.count == 1 {
                t = "\(viewModel.estudantesFiltro4.count) " + "Titulo.Filtro.Acima.Nivel.Singular".localized()
            } else {
                t = "\(viewModel.estudantesFiltro4.count) " + "Titulo.Filtro.Acima.Nivel.Plural".localized()
            }
        }
        
        return t
    }
    
    var descricao: String {
        var d: String = ""
        
        if filtro == "Titulo.Todos".localized() {
            d = ""
        } else if filtro == "Titulo.Sem.Avaliacao".localized() {
            d = "Descricao.Filtro.Sem.Avaliacao".localized()
        } else if filtro == "Titulo.Abaixo.Nivel".localized() {
            d = "Descricao.Filtro.Abaixo.Nivel".localized()
        } else {
            d = "Descricao.Filtro.Acima.Nivel".localized()
        }
        
        return d
    }
    
    // MARK: - Body da View
    var body: some View {
        Text(titulo + "\n").font(.system(size: 15)).foregroundColor(Color.texto1) + Text(descricao).font(.system(size: 12)).foregroundColor(Color.texto2)
            
    }
}
