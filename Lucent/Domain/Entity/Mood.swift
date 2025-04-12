//
//  Mood.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable, Codable {
    case calm
    case joyful
    case tired
    case focused
    case anxious

    var id: String { rawValue }

    var label: String {
        switch self {
        case .calm: return "차분함"
        case .joyful: return "기쁨"
        case .tired: return "피로"
        case .focused: return "몰입"
        case .anxious: return "불안"
        }
    }

    var color: Color {
        switch self {
        case .calm: return Color(hex: "#8BC6EC")
        case .joyful: return Color(hex: "#FFD3A5")
        case .tired: return Color(hex: "#B6BBC4")
        case .focused: return Color(hex: "#D8B5FF")
        case .anxious: return Color(hex: "#FFAAA5")
        }
    }
}
