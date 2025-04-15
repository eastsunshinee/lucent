//
//  LucentStar.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import Foundation

struct LucentStar: Identifiable {
    let id = UUID()
    let emotion: Mood
    let position: CGPoint
    let size: CGFloat
}
