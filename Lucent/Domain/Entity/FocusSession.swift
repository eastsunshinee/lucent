//
//  FocusSession.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import Foundation

struct FocusSession: Identifiable, Codable, Equatable {
    let id: UUID
    let startTime: Date
    let endTime: Date
    let mood: Mood?
    let note: String?

    var duaration: TimeInterval {
        endTime.timeIntervalSince(startTime)
    }

    init(startTime: Date, endTime: Date, mood: Mood?, note: String?) {
        self.id = UUID()
        self.startTime = startTime
        self.endTime = endTime
        self.mood = mood
        self.note = note
    }
}
