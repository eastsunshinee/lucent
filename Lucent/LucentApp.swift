//
//  LucentApp.swift
//  Lucent
//
//  Created by 김동현 on 4/12/25.
//

import SwiftUI

@main
struct LucentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
