//
//  LucentStarFieldView.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//
import SwiftUI

struct LucentStarFieldView: View {
    @ObservedObject var viewModel: LucentStarFieldViewModel

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // 배경: 감성적 은하수 느낌
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "#090E22"),
                        Color(hex: "#1F2232")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                // 은은한 glow circle (배경 보조)
                Circle()
                    .fill(Color.white.opacity(0.03))
                    .frame(width: 800, height: 800)
                    .blur(radius: 100)
                    .offset(x: 100, y: 500)

                // 감정별 별들 시각화
                ForEach(viewModel.stars) { star in
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [
                                    star.emotion.color.opacity(0.95),
                                    star.emotion.color.opacity(0.05)
                                ]),
                                center: .center,
                                startRadius: 0,
                                endRadius: star.size * 0.8
                            )
                        )
                        .frame(width: star.size, height: star.size)
                        .position(star.position)
                        .shadow(color: star.emotion.color.opacity(0.3), radius: 6)
                }
            }
            .onAppear {
                viewModel.loadStars(in: geo.size)
            }
        }
    }
}

#Preview {
    let repository = LocalFocusSessionRepository()
    let vm = LucentStarFieldViewModel(repository: repository)
    return LucentStarFieldView(viewModel: vm)
}
