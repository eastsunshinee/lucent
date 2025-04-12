//
//  EmotionNebulaView.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

struct EmotionStar: Identifiable {
    let id = UUID()
    let emotion: Mood
    let position: CGPoint
    let size: CGFloat
    let blur: CGFloat
}

struct EmotionNebulaView: View {
    let stars: [EmotionStar]

    var body: some View {
        ZStack {
            // 은하수 느낌 배경
            LinearGradient(
                gradient: Gradient(colors: [.black, Color(.sRGB, red: 0.05, green: 0.05, blue: 0.1, opacity: 1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // 별 표시
            ForEach(stars) { star in
                Circle()
                    .fill(star.emotion.color)
                    .frame(width: star.size, height: star.size)
                    .blur(radius: star.blur)
                    .opacity(0.65)
                    .position(star.position)
                    .shadow(color: star.emotion.color.opacity(0.4), radius: 6, x: 0, y: 0)
                    .animation(
                        Animation.easeInOut(duration: Double.random(in: 3...6))
                            .repeatForever(autoreverses: true),
                        value: UUID() // random identity to simulate drift
                    )
            }
        }
    }
}

#Preview {
    let sampleStars = (0..<36).map { _ in
        EmotionStar(
            emotion: Mood.allCases.randomElement()!,
            position: CGPoint(
                x: CGFloat.random(in: 20...350),
                y: CGFloat.random(in: 20...700)
            ),
            size: CGFloat.random(in: 10...20),
            blur: CGFloat.random(in: 0.5...2.5)
        )
    }
    return EmotionNebulaView(stars: sampleStars)
}
