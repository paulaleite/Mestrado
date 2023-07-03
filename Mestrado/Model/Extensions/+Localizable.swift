//
//  +Localizable.swift
//  Mestrado
//
//  Created by Paula Leite on 03/07/23.
//

import Foundation

internal extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
