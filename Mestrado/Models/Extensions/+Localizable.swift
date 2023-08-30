//
//  +Localizable.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation

internal extension String {
    
    /// Função que constroi um atalho para a localização de *Strings*.
    /// - Returns: A String localizada.
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
