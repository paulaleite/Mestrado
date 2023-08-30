//
//  LoadingView.swift
//  Mestrado
//
//  Created by Paula Leite on 30/08/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack {
            ProgressView()
            Text("Titulo.Carregando".localized())
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

