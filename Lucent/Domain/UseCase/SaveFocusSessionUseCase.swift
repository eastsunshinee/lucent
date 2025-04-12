//
//  SaveFocusSessionUseCase.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation

protocol SaveFocusSessionUseCase {
    func excute(session: FocusSession) async throws// 비동기 저장 가능성 대비, ex: 파일, 클라우드 등
}
