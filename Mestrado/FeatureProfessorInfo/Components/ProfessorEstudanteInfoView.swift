//
//  ProfessorEstudanteInfoView.swift
//  Mestrado
//
//  Created by Paula Leite on 01/09/23.
//

import SwiftUI

struct ProfessorEstudanteInfoView: View {
    // MARK: - Variáveis e Constantes
    
    var estudante: EstudanteFiltroModel
    
    // MARK: - Body da View
    var body: some View {
        VStack {
            Text(estudante.nome)
                .font(.body)
                .foregroundColor(Color.texto1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 2)
            
            ProfessorEstudanteDetalheView(qtd: "\(estudante.numObjsForaDoNivel)", titulo: "Descricao.Fora.Nivel".localized())
            
            ProfessorEstudanteDetalheView(qtd: "\(estudante.numObjsSemAvaliacao)", titulo: "Descricao.Sem.Avaliacao".localized())
        }
    }
}
