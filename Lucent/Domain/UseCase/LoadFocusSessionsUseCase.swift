//
//  LoadFocusSessionsUseCase.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation

protocol LoadFocusSessionsUseCase {
    func excute() async throws -> [FocusSession]
}
