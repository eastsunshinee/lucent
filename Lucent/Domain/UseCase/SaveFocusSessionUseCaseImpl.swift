//
//  SaveFocusSessionUseCaseImpl.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation
import Combine

final class SaveFocusSessionUseCaseImpl: SaveFocusSessionUseCase {
    private let repository: FocusSessionRepository
    
    init(repository: FocusSessionRepository) {
        self.repository = repository
    }
    
    func execute(session: FocusSession) async throws {
        try await repository.save(session: session)
    }
    
    func executePublisher(session: FocusSession) -> AnyPublisher<Void, Error> {
        Future { promise in
            Task {
                do {
                    try await self.repository.save(session: session)
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
