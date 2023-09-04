//
//  PostDisciplinaView.swift
//  Mestrado
//
//  Created by Paula Leite on 04/09/23.
//

import SwiftUI

struct PostDisciplinaView: View {
    var body: some View {
        Form {
            SectionTituloDisciplinaView()
            SectionMomentosAvaliativosDisciplinaView()
            SectionEstudantesDisciplinaView()
        }
    }
}
