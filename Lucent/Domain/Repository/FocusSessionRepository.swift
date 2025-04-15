//
//  FocusSessionRepository.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation

protocol FocusSessionRepository {
    func save(session: FocusSession) async throws
    func delete(session: FocusSession) async throws
    func loadAll() async throws -> [FocusSession]
}
