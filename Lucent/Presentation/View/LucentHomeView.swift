//
//  LucentHomeView.swift
//  Lucent
//
//  Created by 김동현 on 4/13/25.
//

import SwiftUI

struct LucentHomeView: View {
    var body: some View {
        TabView {
            FocusTimerTab()
                .tabItem {
                    Label("타이머", systemImage: "timer")
                }

            FocusHistoryTab()
                .tabItem {
                    Label("기록", systemImage: "list.bullet")
                }

            StarFieldTab()
                .tabItem {
                    Label("성운", systemImage: "sparkles")
                }
        }
    }
}


#Preview {
    LucentHomeView()
}
