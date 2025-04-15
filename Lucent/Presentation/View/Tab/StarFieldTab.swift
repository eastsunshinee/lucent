//
//  StarFieldTab.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import SwiftUI

struct StarFieldTab: View {
    var body: some View {
        let repository = LocalFocusSessionRepository()
        let useCase = LoadFocusSessionsUseCaseImpl(repository: repository)
        let viewModel = LucentStarFieldViewModel(loadUseCase: useCase)
        LucentStarFieldView(viewModel: viewModel)
    }
}

#Preview {
    StarFieldTab()
}
