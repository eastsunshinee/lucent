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

    private let loadUseCase: LoadFocusSessionsUseCase
    private let deleteUseCase: DeleteFocusSessionUseCase
    private var cancellables = Set<AnyCancellable>()

    init(loadUseCase: LoadFocusSessionsUseCase, deleteUseCase: DeleteFocusSessionUseCase) {
        self.loadUseCase = loadUseCase
        self.deleteUseCase = deleteUseCase
    }

    func loadSessions() {
        loadUseCase.executePublisher()
            .map { $0.sorted { $0.startTime > $1.startTime } }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("세션 불러오기 실패: \(error)")
                }
            }, receiveValue: { [weak self] loadedSessions in
                self?.sessions = loadedSessions
            })
            .store(in: &cancellables)
    }

    func deleteSession(_ session: FocusSession) {
        Task {
            do {
                try await deleteUseCase.execute(session: session)
                await MainActor.run {
                    sessions.removeAll { $0.id == session.id }
                }
            } catch {
                print("세션 삭제 실패: \(error)")
            }
        }
    }

}
