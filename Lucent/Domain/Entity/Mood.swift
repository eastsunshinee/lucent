//
//  Mood.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable, Codable {
    case calm, joyful, tired, focused, anxious

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .calm: return Color(hex: "#8BC6EC")      // soft aqua
        case .joyful: return Color(hex: "#FFD3A5")    // coral-peach
        case .tired: return Color(hex: "#B6BBC4")     // mist grey
        case .focused: return Color(hex: "#D8B5FF")   // lavender
        case .anxious: return Color(hex: "#FFAAA5")   // muted soft red
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
