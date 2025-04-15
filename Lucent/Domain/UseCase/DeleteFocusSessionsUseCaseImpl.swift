//
//  DeleteFocusSessionsUseCaseImpl.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation

final class DeleteFocusSessionsUseCaseImpl: DeleteFocusSessionUseCase {
    private let repository: FocusSessionRepository

    init(repository: FocusSessionRepository) {
        self.repository = repository
    }

    func execute(session: FocusSession) async throws {
        try await repository.delete(session: session)
    }
}
