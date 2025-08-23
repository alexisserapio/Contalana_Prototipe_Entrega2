//
//  StringExtension.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

