//
//  MestradoApp.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import SwiftUI

@main
struct MestradoApp: App {
    @StateObject var estudanteFetcher = EstudanteFetcher()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(estudanteFetcher)
        }
    }
}
