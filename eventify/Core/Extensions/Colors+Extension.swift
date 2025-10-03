//
//  Colors+Extension.swift
//  eventify
//
//  Created by BSTAR on 22/09/2025.
//

import Foundation
import SwiftUI

extension Color {
    static let colors = Colors()
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red   = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue  = Double(hex & 0xFF) / 255.0
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
