//
//  AutoavaliacaoEstudanteView.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import SwiftUI

struct AutoavaliacaoEstudanteInfoDTO {
    /// Lista de Momentos Avaliativos da Disciplina do Estudante.
    var momentosAvaliativos: [MomentoAvaliativo]
}

struct AutoavaliacaoEstudanteInfoView: View {
    
    // MARK: - Variáveis e Constantes
    /// Conjunto de dados que são solicitados por essa struct, o qual são representados pela Autoavaliacao Estudante Info DTO.
    let dto: AutoavaliacaoEstudanteInfoDTO
    
    /// Variável computável que configura adiciona no começo da lista de momentos avaliativos, a opção de filtro com todos os objetivos.
    var momentos: [String] {
        var resultado: [String] = []
        for momentoAvaliativo in dto.momentosAvaliativos {
            resultado.append(momentoAvaliativo.titulo)
        }
        resultado.insert("Titulo.Momentos.Todos".localized(), at: 0)
        return resultado
    }
    
    /// Estado que informa qual momento avaliativo está selecionado
    @State var momentoAvaliativoSelecionado = "Titulo.Momentos.Todos".localized()
    
    // MARK: - Body da View
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Titulo.Autoavaliacao".localized())
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding([.vertical, .horizontal], 16)
                    
                    NavigationLink {
                        AutoavaliacaoEstudanteCriacaoView()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.body.bold())
                            .foregroundColor(Color.corDeAcao)
                    }
                    .padding(.trailing, 4)
                    
                    Menu {
                        Menu {
                            Picker("Filtrar por", selection: $momentoAvaliativoSelecionado) {
                                ForEach(momentos, id: \.self) {
                                    Text($0)
                                }
                            }
                        } label: {
                            HStack {
                                Text("Titulo.Filtro".localized() + "\n" + momentoAvaliativoSelecionado)
                                Image(systemName: "arrow.up.arrow.down")
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.body.bold())
                            .foregroundColor(Color.corDeAcao)
                    }
                    .padding(.trailing, 16)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct AutoavaliacaoEstudanteView_Previews: PreviewProvider {
    static var previews: some View {
        AutoavaliacaoEstudanteInfoView(dto: AutoavaliacaoEstudanteInfoDTO(momentosAvaliativos: [MomentoAvaliativo(id: "", titulo: "Momento 1", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 2", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 3", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 4", data: Date.now, objetivosDeAprendizado: []), MomentoAvaliativo(id: "", titulo: "Momento 5", data: Date.now, objetivosDeAprendizado: [])]))
    }
}
