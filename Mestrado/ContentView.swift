//
//  ContentView.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Body da View
    
    var body: some View {
        EstudanteInfoView(estudanteID: "1", disciplinaID: "1")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
