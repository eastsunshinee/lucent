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
        FocusHistoryView(repository: repository)
    }
}

#Preview {
    FocusHistoryTab()
}
