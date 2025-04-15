//
//  MoodPickerView.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

struct MoodPickerView: View {
    @Binding var selected: Mood?

    var body: some View {
        HStack(spacing: 12) {
            ForEach(Mood.allCases) { mood in
                Button(action: {
                    selected = mood
                }) {
                    Text(mood.label)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(
                            selected == mood
                            ? mood.color.opacity(0.25)
                            : Color.white.opacity(0.05)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(mood.color.opacity(selected == mood ? 0.6 : 0.0), lineWidth: 1)
                        )
                        .shadow(color: selected == mood ? mood.color.opacity(0.4) : .clear, radius: 8)
                }
            }
        }
    }
}
