//
//  PessoaBotaoView.swift
//  Mestrado
//
//  Created by Paula Leite on 31/08/23.
//

import SwiftUI

/// Visualizaçõa que permite a Pessoa entrar na tela de Perfil.
struct PessoaBotaoView: View {
    // MARK: Body da View
    var body: some View {
        NavigationLink {
            PessoaView()
        } label: {
            Image(systemName: "person.circle")
                .tint(Color.corDeAcao)
                .fontWeight(.semibold)
        }
    }
}
