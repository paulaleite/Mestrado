//
//  DataCellView.swift
//  Mestrado
//
//  Created by Paula Leite on 28/08/23.
//

import SwiftUI

/// Com essa visualização, é possível selecionar a data da Autoavaliação.
struct DataCellView: View {
    
    // MARK: - Variávies e Constantes
    
    /// Estado que informa qual data está selecionada.
    @Binding var data: Date
    
    /// Intervalo de Tempo do DatePicker
    let intervalo: ClosedRange<Date> = {
        let calendario = Calendar.current
        let componentesIniciais = DateComponents(year: 2023, month: 1, day: 1)
        let componentesFinais = DateComponents(year: 2050, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendario.date(from: componentesIniciais)! ... calendario.date(from: componentesFinais)!
    }()
    
    // MARK: - Body da View
    var body: some View {
        DatePicker("Titulo.Data".localized(), selection: $data, in: intervalo, displayedComponents: [.date])
            .datePickerStyle(.compact)
    }
}
