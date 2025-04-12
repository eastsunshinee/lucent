//
//  LucentStarFieldView.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//
import SwiftUI

struct LucentStar: Identifiable {
    let id = UUID()
    let emotion: Mood
    let position: CGPoint
    let size: CGFloat
}

struct LucentStarFieldView: View {
    let stars: [LucentStar]

    var body: some View {
        ZStack {
            // 현대적이고 감성적인 그라디언트 + Glow 덩어리
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#090E22"),
                    Color(hex: "#1F2232")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // 흐릿한 glow layer
            Circle()
                .fill(Color.white.opacity(0.04))
                .frame(width: 800, height: 800)
                .blur(radius: 100)
                .offset(x: 150, y: 500)

            // 별들
            ForEach(stars) { star in
                Circle()
                    .fill(star.emotion.color)
                    .frame(width: star.size)
                    .blur(radius: 0.5)
                    .overlay(
                        Circle()
                            .stroke(star.emotion.color.opacity(0.6), lineWidth: 0.5)
                            .blur(radius: 2)
                    )
                    .shadow(color: star.emotion.color.opacity(0.3), radius: 8)
                    .position(star.position)
            }
        }
    }
}

#Preview {
    let sampleStars = (0..<40).map { _ in
        LucentStar(
            emotion: Mood.allCases.randomElement()!,
            position: CGPoint(
                x: CGFloat.random(in: 20...350),
                y: CGFloat.random(in: 20...700)
            ),
            size: CGFloat.random(in: 10...20)
        )
    }
    return LucentStarFieldView(stars: sampleStars)
}
