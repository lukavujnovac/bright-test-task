//
//  TextStyle.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import UIKit
import SwiftUI

extension Text {
    func textStyle(_ textStyle: TextStyle) -> some View {
        font(swiftUIFont(named: textStyle.name, size: textStyle.size))
            .fontWithLineHeight(font: textStyle.font, lineHeight: textStyle.lineHeight)
            .fontWeight(textStyle.weight)
    }
    
    private func swiftUIFont(named: String, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(named, fixedSize: size)
    }
}

struct TextStyle {
    let font: UIFont
    let size: CGFloat
    let weight: Font.Weight
    let lineHeight: CGFloat
    let name: String
}

private struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}

private extension View {
    func fontWithLineHeight(font: UIFont, lineHeight: CGFloat) -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: font, lineHeight: lineHeight))
    }
}
