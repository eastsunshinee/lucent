//
//  FocusHistoryView.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import SwiftUI

struct FocusHistoryView: View {
    @StateObject private var viewModel: FocusHistoryViewModel

    init(viewModel: FocusHistoryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List(viewModel.sessions) { session in
                HStack(alignment: .top, spacing: 12) {
                    Circle()
                        .fill(session.mood?.color ?? .gray)
                        .frame(width: 14, height: 14)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(session.mood?.label ?? "무감정")
                            .font(.headline)

                        Text(session.note ?? "기록 없음")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(session.startTime.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("기록")
        }
        .onAppear {
            viewModel.loadSessions()
        }
    }
}

#Preview {
    let repository = LocalFocusSessionRepository()
    let useCase = LoadFocusSessionsUseCaseImpl(repository: repository)
    let viewModel = FocusHistoryViewModel(loadUseCase: useCase)
    FocusHistoryView(viewModel: viewModel)
}
