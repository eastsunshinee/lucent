//
//  DeleteFocusSessionsUseCaseImpl.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation
import Combine

final class DeleteFocusSessionsUseCaseImpl: DeleteFocusSessionUseCase {
    private let repository: FocusSessionRepository

    init(repository: FocusSessionRepository) {
        self.repository = repository
    }

    func execute(session: FocusSession) async throws {
        try await repository.delete(session: session)
    }

    func executePublisher(session: FocusSession) -> AnyPublisher<Void, Error> {
        Future { promise in
            Task {
                do {
                    try await self.repository.delete(session: session)
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

}
