//
//  LoadFocusSessionsUseCaseImpl.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation
import Combine

final class LoadFocusSessionsUseCaseImpl: LoadFocusSessionsUseCase {
    private let repository: FocusSessionRepository

    init(repository: FocusSessionRepository) {
        self.repository = repository
    }

    func execute() async throws -> [FocusSession] {
        return try await repository.loadAll()
    }

    func excutePublisher() -> AnyPublisher<[FocusSession], any Error> {
        Future { promise in
            Task {
                do {
                    let result = try await self.repository.loadAll()
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
