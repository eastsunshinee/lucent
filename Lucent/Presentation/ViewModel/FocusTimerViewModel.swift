//
//  FocusTimerViewModel.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation
import Combine

final class FocusTimerViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var isRunning: Bool = false
    @Published var timeRemaining: Int = 0
    @Published var selectedMood: Mood?
    @Published var note: String = ""

    // MARK: - Private Properties
    private let sessionLength: Int
    private var timer: AnyCancellable?
    private var startTime: Date?

    // MARK: - Dependencies
    private let saveUseCase: SaveFocusSessionUseCase

    // MARK: - Init
    init(sessionLength: Int = 25 * 60, saveUseCase: SaveFocusSessionUseCase) {
        self.sessionLength = sessionLength
        self.timeRemaining = sessionLength
        self.saveUseCase = saveUseCase
    }

    // MARK: - Public Methods

    func startTimer() {
        startTime = Date()
        isRunning = true
        timeRemaining = sessionLength

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.timeRemaining -= 1

                if self.timeRemaining <= 0 {
                    self.completeSession()
                }
            }
    }

    func stopTimer() {
        timer?.cancel()
        isRunning = false
        timeRemaining = sessionLength
    }

    func completeSession() {
        timer?.cancel()
        isRunning = false

        guard let start = startTime else { return }

        let end = Date()
        let session = FocusSession(startTime: start, endTime: end, mood: selectedMood, note: note)

        Task {
            do {
                try await saveUseCase.execute(session: session)
                print("Session saved: \(session)")
            } catch {
                print("Session Failed: \(error)")
            }
        }
    }
}
