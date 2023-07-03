//
//  ContentView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ReflexaoItemView(sentimento: .amei, reflexaoTexto: "Texte")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
