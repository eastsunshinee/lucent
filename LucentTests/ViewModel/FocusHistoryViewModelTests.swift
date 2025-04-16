//
//  FocusHistoryViewModelTests.swift
//  LucentTests
//
//  Created by 김동현 on 4/16/25.
//

import XCTest
@testable import Lucent

final class FocusHistoryViewModelTests: XCTestCase {
    private var stubRepository: StubFocusSessionRepository!
    private var loadUseCase: LoadFocusSessionsUseCase!
    private var deleteUseCase: DeleteFocusSessionUseCase!
    private var viewModel: FocusHistoryViewModel!

    override func setUp() {
        stubRepository = StubFocusSessionRepository()
        loadUseCase = LoadFocusSessionsUseCaseImpl(repository: stubRepository)
        deleteUseCase = DeleteFocusSessionsUseCaseImpl(repository: stubRepository)
        viewModel = FocusHistoryViewModel(loadUseCase: loadUseCase, deleteUseCase: deleteUseCase)
    }

    override func tearDown() {
        stubRepository = nil
        loadUseCase = nil
        deleteUseCase = nil
        viewModel = nil
    }

    func testLoadSessions_shouldSortByDescendingStartTime() async throws {
        let now = Date()
        let session1 = FocusSession(startTime: now, endTime: now, mood: .calm, note: "최근")
        let session2 = FocusSession(startTime: now.addingTimeInterval(-1000), endTime: now, mood: .tired, note: "이전")

        stubRepository.saved = [session2, session1]

        viewModel.loadSessions()
        try await Task.sleep(nanoseconds: 100_000_000)

        XCTAssertEqual(viewModel.sessions.count, 2)
        XCTAssertEqual(viewModel.sessions.first?.note, "최근")
    }

    func testDeleteSession_shouldRemoveFromSessionsAndRepository() async {
        // Given
        let session = FocusSession(startTime: .now, endTime: .now, mood: .joyful, note: "삭제 대상")
        stubRepository.saved = [session]
        viewModel.loadSessions()

        // When
        viewModel.deleteSession(session)
        try? await Task.sleep(nanoseconds: 100_000_000) // async 반영 대기

        // Then
        XCTAssertTrue(viewModel.sessions.isEmpty)
        XCTAssertTrue(stubRepository.saved.isEmpty)
    }
}
