//
//  FocusTimerTab.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import SwiftUI

struct FocusTimerTab: View {
    private let useCase = SaveFocusSessionUseCaseImpl(
        repository: LocalFocusSessionRepository()
    )

    var body: some View {
        let viewModel = FocusTimerViewModel(saveUseCase: useCase)
        FocusTimerView(viewModel: viewModel)
    }
}

#Preview {
    FocusTimerTab()
}
