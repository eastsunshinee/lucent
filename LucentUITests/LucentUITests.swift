//
//  LucentUITests.swift
//  LucentUITests
//
//  Created by 김동현 on 4/12/25.
//

import XCTest

final class LucentUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //    @MainActor
    //    func testExample() throws {
    //        // UI tests must launch the application that they test.
    //        let app = XCUIApplication()
    //        app.launch()
    //
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //    }
    //
    //    @MainActor
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }

    func testFocusSessionRecordingFlow() throws {
        // 1. 시작 버튼 탭
        let startButton = app.buttons["집중 시작"]
        XCTAssertTrue(startButton.waitForExistence(timeout: 2))
        startButton.tap()

        // 2. 감정 선택
        let moodButton = app.buttons["기쁨"]
        XCTAssertTrue(moodButton.waitForExistence(timeout: 2))
        moodButton.tap()

        // 3. 메모 입력
        let noteField = app.textFields["오늘의 감정을 한 줄로 남겨보세요"]
        XCTAssertTrue(noteField.waitForExistence(timeout: 2))
        noteField.tap()
        noteField.typeText("UI 테스트 기록")

        // 4. 중단 버튼
        let stopButton = app.buttons["중단하기"]
        XCTAssertTrue(stopButton.waitForExistence(timeout: 2))
        stopButton.tap()

        // 5. 기록 탭 이동
        let historyTab = app.tabBars.buttons["기록"]
        XCTAssertTrue(historyTab.waitForExistence(timeout: 2))
        historyTab.tap()

        // 6. 방금 남긴 기록이 표시되는지 확인
        let savedNote = app.staticTexts["UI 테스트 기록"]
        XCTAssertTrue(savedNote.waitForExistence(timeout: 2))

        // 7. 성운 탭 이동
        let starfieldTab = app.tabBars.buttons["성운"]
        XCTAssertTrue(starfieldTab.waitForExistence(timeout: 2))
        starfieldTab.tap()
    }

    func testDeleteFirstVisibleSessionFromHistory() throws {
        // 1. 기록 탭 이동
        let historyTab = app.tabBars.buttons["기록"]
        XCTAssertTrue(historyTab.waitForExistence(timeout: 2))
        historyTab.tap()

        // 2. 셀 확인
        let cells = app.collectionViews.cells
        if cells.count == 0 {
            throw XCTSkip("삭제할 셀이 없음")
        }

        // 3. 첫 번째 셀 내부 텍스트(label) 가져오기
        let firstCell = cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)

        let firstLabel = firstCell.staticTexts.element(boundBy: 0).label
        XCTAssertFalse(firstLabel.isEmpty, "첫 셀의 라벨이 비어 있음")

        // 4. 삭제 수행
        firstCell.swipeLeft()
        let deleteButton = app.buttons["Delete"]
        XCTAssertTrue(deleteButton.waitForExistence(timeout: 2))
        deleteButton.tap()

        sleep(1) // 삭제 애니메이션 및 반영 대기

        // 5. 삭제 후 동일 텍스트 가진 셀 존재 여부 확인
        let remainingLabels = cells.staticTexts.allElementsBoundByIndex.map { $0.label }
        let isLabelStillExists = remainingLabels.contains(firstLabel)

        XCTAssertFalse(isLabelStillExists, "삭제된 셀의 라벨이 여전히 존재함: \(firstLabel)")
    }
}
