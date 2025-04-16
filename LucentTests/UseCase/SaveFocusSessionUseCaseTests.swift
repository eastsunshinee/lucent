//
//  SaveFocusSessionUseCaseTests.swift
//  LucentTests
//
//  Created by 김동현 on 4/16/25.
//

import XCTest
@testable import Lucent

final class SaveFocusSessionUseCaseTests: XCTestCase {
    private var stubRepository: StubFocusSessionRepository!
    private var useCase: SaveFocusSessionUseCase!
    
    override func setUp() {
        super.setUp()
        stubRepository = StubFocusSessionRepository()
        useCase = SaveFocusSessionUseCaseImpl(repository: stubRepository)
    }
    
    override func tearDown() {
        stubRepository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_shouldAppendSessionToRepository() async throws {
        // Given
        let session = FocusSession(startTime: Date(), endTime: Date(), mood: .joyful, note: "테스트 세션")
        
        // When
        try await useCase.execute(session: session)
        
        // Then
        XCTAssertEqual(stubRepository.saved.count, 1)
        XCTAssertEqual(stubRepository.saved.first?.note, "테스트 세션")
    }
    
    func testExecute_shouldThrow_whenRepositoryFails() async {
        // Given
        stubRepository.shouldFail = true
        let session = FocusSession(
            startTime: Date(),
            endTime: Date(),
            mood: .anxious,
            note: "실패 테스트"
        )
        
        // When & Then
        do {
            try await useCase.execute(session: session)
            XCTFail("에러가 발생해야 하지만 성공했습니다")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
