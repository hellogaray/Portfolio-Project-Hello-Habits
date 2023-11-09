//
//  Hello__Habits_App.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/7/23.
//

import SwiftUI

@main
struct Hello__Habits_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
