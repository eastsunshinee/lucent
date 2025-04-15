//
//  LucentStarFieldViewModel.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import Foundation
import SwiftUI
import Combine

final class LucentStarFieldViewModel: ObservableObject {
    @Published private(set) var stars: [LucentStar] = []
    private let loadUseCase: LoadFocusSessionsUseCase

    init(loadUseCase: LoadFocusSessionsUseCase) {
        self.loadUseCase = loadUseCase
    }

    func loadStars(in size: CGSize) {
        Task {
            do {
                let sessions = try await loadUseCase.execute()

                let mapped = sessions.map { session in
                    LucentStar(
                        emotion: session.mood ?? .calm,
                        position: CGPoint(
                            x: CGFloat.random(in: 0...size.width),
                            y: CGFloat.random(in: 0...size.height)
                        ),
                        size: CGFloat.random(in: 10...22)
                    )
                }

                DispatchQueue.main.async {
                    self.stars = mapped
                }
            } catch {
                print("LucentStar 로딩 실패: \(error)")
            }
        }
    }
}
