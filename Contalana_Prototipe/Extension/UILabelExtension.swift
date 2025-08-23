//
//  UILabelExtension.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import Foundation
import UIKit

extension UILabel {
    func setCustomFont(fontName: String, size: CGFloat = 17, style: UIFont.TextStyle = .body ) {
        guard let customFont = UIFont(name: fontName, size: size) else {
            return
        }
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        self.font = customFont
        self.font = fontMetrics.scaledFont(for: customFont)
        self.adjustsFontForContentSizeCategory = true
    }
}
