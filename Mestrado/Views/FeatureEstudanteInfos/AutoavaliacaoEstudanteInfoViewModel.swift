//
//  AutoavaliacaoEstudanteInfoViewModel.swift
//  Mestrado
//
//  Created by Paula Leite on 24/08/23.
//

import Foundation
import Combine

class AutoavaliacaoEstudanteInfoViewModel: ObservableObject {
    
    @Published
    var reflexoes: [ReflexaoFeatureEstudanteInfo] = []
    
    @Published
    var objetivos: [ObjetivoFeatureEstudanteInfo] = []
    
    @Published
    var estudanteId: String? = nil
    
    // apaga
    @Published
    var estudante: Estudante? = nil
    
    init() {
        startup()
    }
    
    let service: APIServicoProtocol = APIServico()
    
    var cancellables: Set<AnyCancellable> = .init()
    
    private func startup() {
        $estudanteId.sink {[weak self] string in
            Task { [weak self] in
                guard let string else { return }
                self?.estudante = try? await self?.service.getEstudantePorID(estudante: string)
            }
        }
        .store(in: &cancellables)
    }
}
