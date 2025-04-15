//
//  LoadFocusSessionsUseCaseImpl.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation

final class LoadFocusSessionsUseCaseImpl: LoadFocusSessionsUseCase {
    private let repository: FocusSessionRepository

    init(repository: FocusSessionRepository) {
        self.repository = repository
    }

    func excute() async throws -> [FocusSession] {
        return try await repository.loadAll()
    }
}
