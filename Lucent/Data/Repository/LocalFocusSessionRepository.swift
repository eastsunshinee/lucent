//
//  LocalFocusSessionRepository.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation

final class LocalFocusSessionRepository: FocusSessionRepository {
    private let key = "focusSessions"

    func save(session: FocusSession) async throws {
        var sessions = try await loadAll()
        sessions.append(session)
        let data = try JSONEncoder().encode(sessions)
        UserDefaults.standard.set(data, forKey: key)
    }

    func loadAll() async throws -> [FocusSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        let sessions = try JSONDecoder().decode([FocusSession].self, from: data)
        return sessions
    }
}
