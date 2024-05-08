//
//  Palette.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Charts
import SwiftUI

private extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        let redBinary = (rgbValue & 0xFF0000) >> 16
        let greenBinary = (rgbValue & 0x00FF00) >> 8
        let blueBinary = rgbValue & 0x0000FF
        let red = Double(redBinary) / 255.0
        let green = Double(greenBinary) / 255.0
        let blue = Double(blueBinary) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

public extension Color {
    
    // MARK: Text Colors
    static let primaryText = Color(hex: "E7FBE2")
    static let secondaryText = Color(hex: "5A5A5A")
    
    // MARK: Background colors
    static let cardBackground = Color(hex: "1A1A1A")
    static let primaryBackground = Color(hex: "F5F5F5")
    
    // MARK: Activity colors
    static let activityOrange = Color(hex: "FF6C4E")
}

extension View {
    
    /// Set the foreground color within `self`.
    @inlinable
    public func foregroundColor(_ color: Color) -> some View {
        foregroundStyle(color)
    }
    
    /// Set the background color within `self`.
    @inlinable
    public func backgroundColor(_ color: Color) -> some View {
        background(color)
    }
    
    /// Set the background color within `shape`.
    @inlinable
    public func backgroundColor<T>(_ color: Color, in shape: T) -> some View where T: InsettableShape {
        background(color, in: shape)
    }
}

extension ChartContent {
    /// Set the foreground color within `self`.
    @inlinable
    public func foregroundColor(_ color: Color) -> some ChartContent {
        foregroundStyle(color)
    }
}
