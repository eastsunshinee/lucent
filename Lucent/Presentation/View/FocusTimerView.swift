//
//  FocusTimerView.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

struct FocusTimerView: View {
    @ObservedObject var viewModel: FocusTimerViewModel

    var body: some View {
        VStack(spacing: 32) {
            Text(timeFormatted(viewModel.timeRemaining))
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.top, 40)

            // 감정 선택 (Mood Picker)
            MoodPickerView(selected: $viewModel.selectedMood)

            // 메모 입력
            TextField("오늘의 한 줄 회고를 남겨보세요", text: $viewModel.note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // 시작 / 중단 버튼
            Button(action: {
                viewModel.isRunning ? viewModel.stopTimer() : viewModel.startTimer()
            }) {
                Text(viewModel.isRunning ? "중단하기" : "집중 시작")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
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

