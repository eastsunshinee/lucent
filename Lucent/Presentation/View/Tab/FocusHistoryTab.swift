//
//  FocusHistoryTab.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import SwiftUI

struct FocusHistoryTab: View {
    var body: some View {
        let repository = LocalFocusSessionRepository()
        let loadUseCase = LoadFocusSessionsUseCaseImpl(repository: repository)
        let deleteUseCase = DeleteFocusSessionsUseCaseImpl(repository: repository)
        let viewModel = FocusHistoryViewModel(loadUseCase: loadUseCase, deleteUseCase: deleteUseCase)
        FocusHistoryView(viewModel: viewModel)

    }
}

#Preview {
    FocusHistoryTab()
}
