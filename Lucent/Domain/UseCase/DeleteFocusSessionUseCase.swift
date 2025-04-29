//
//  DeleteFocusSessionUseCase.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation
import Combine

protocol DeleteFocusSessionUseCase {
    func execute(session: FocusSession) async throws
    func executePublisher(session: FocusSession) -> AnyPublisher<Void, Error>
}
