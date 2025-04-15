//
//  FocusTimerView.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

struct FocusTimerView: View {
    @ObservedObject var viewModel: FocusTimerViewModel
    @State private var animateBreath = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color(hex: "#0C0F2E")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 32) {
                Text(timeFormatted(viewModel.timeRemaining))
                    .font(.system(size: 56, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .scaleEffect(animateBreath ? 1.03 : 1.0)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animateBreath)

                MoodPickerView(selected: $viewModel.selectedMood)

                TextField("오늘의 감정을 한 줄로 남겨보세요", text: $viewModel.note)
                    .padding()
                    .background(Color.white.opacity(0.07))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                Button(action: {
                    viewModel.isRunning ? viewModel.stopTimer() : viewModel.startTimer()
                }) {
                    Text(viewModel.isRunning ? "중단하기" : "집중 시작")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.isRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .onAppear {
            animateBreath = true
        }
    }
}

private func timeFormatted(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    return String(format: "%02d:%02d", minutes, remainingSeconds)
}

#Preview {
    let useCase = SaveFocusSessionUseCaseImpl(repository: LocalFocusSessionRepository())
    let viewModel = FocusTimerViewModel(saveUseCase: useCase)
    return FocusTimerView(viewModel: viewModel)
}

