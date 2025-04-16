//
//  StubFocusSessionRepository.swift
//  LucentTests
//
//  Created by 김동현 on 4/16/25.
//

import Foundation

@testable import Lucent

final class StubFocusSessionRepository: FocusSessionRepository {
    var saved: [FocusSession] = []
    var shouldFail = false

    func save(session: FocusSession) async throws {
        if shouldFail { throw NSError(domain: "TestError", code: 1) }
        saved.append(session)
    }

    func loadAll() async throws -> [FocusSession] {
        if shouldFail { throw NSError(domain: "TestError", code: 2) }
        return saved
    }

    func delete(session: FocusSession) async throws {
        if shouldFail { throw NSError(domain: "TestError", code: 3) }
        saved.removeAll { $0.id == session.id }
    }

}
