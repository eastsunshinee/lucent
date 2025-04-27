//
//  LoadFocusSessionsUseCase.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation
import Combine

protocol LoadFocusSessionsUseCase {
    func execute() async throws -> [FocusSession]
    func excutePublisher() -> AnyPublisher<[FocusSession], Error>
}
