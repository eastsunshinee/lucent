//
//  SaveFocusSessionUseCaseImpl.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation

final class SaveFocusSessionUseCaseImpl: SaveFocusSessionUseCase {
    private let repository: FocusSessionRepository

    init(repository: FocusSessionRepository) {
        self.repository = repository
    }

    func execute(session: FocusSession) async throws {
        try await repository.save(session: session)
    }
}
