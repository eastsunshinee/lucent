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
        HStack(spacing: 16) {
            ForEach(Mood.allCases) { mood in
                Button(action: {
                    selected = mood
                }) {
                    Text(mood.label)
                        .padding(8)
                        .background(selected == mood ? mood.color.opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
