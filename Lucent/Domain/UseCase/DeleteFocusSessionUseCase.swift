//
//  DeleteFocusSessionUseCase.swift
//  Lucent
//
//  Created by 김동현 on 4/15/25.
//

import Foundation

protocol DeleteFocusSessionUseCase {
    func execute(session: FocusSession) async throws
}
