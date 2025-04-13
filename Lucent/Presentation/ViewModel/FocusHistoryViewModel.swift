//
//  FocusHistoryViewModel.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import Foundation
import Combine

final class FocusHistoryViewModel: ObservableObject {
    @Published private(set) var sessions: [FocusSession] = []

    private let repository: FocusSessionRepository

    init(repository: FocusSessionRepository) {
        self.repository = repository
    }

    func loadSessions() {
        Task {
            do {
                let loaded = try await repository.loadAll()
                DispatchQueue.main.async {
                    self.sessions = loaded.sorted(by: { $0.startTime > $1.startTime })
                }
            } catch {
                print("세션 불러오기 실패: \(error)")
            }
        }
    }
}
