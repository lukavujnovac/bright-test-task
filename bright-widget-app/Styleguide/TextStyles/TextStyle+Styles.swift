//
//  TextStyle+Styles.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import SwiftUI

extension TextStyle {
    
    static let title01: TextStyle = TextStyle(
        font: UIFont(name: "Satoshi-Regular", size: 20) ?? .systemFont(ofSize: 20),
        size: 20,
        weight: .medium,
        lineHeight: 32,
        name: "title01"
    )
    
    static let body01: TextStyle = TextStyle(
        font: UIFont(name: "Satoshi-Medium", size: 13) ?? .systemFont(ofSize: 13),
        size: 13,
        weight: .medium,
        lineHeight: 22,
        name: "body01"
    )
    
    static let body02: TextStyle = TextStyle(
        font:  UIFont(name: "Satoshi-Regular", size: 12) ?? .systemFont(ofSize: 13),
        size: 12,
        weight: .light,
        lineHeight: 22,
        name: "body02"
    )
}
