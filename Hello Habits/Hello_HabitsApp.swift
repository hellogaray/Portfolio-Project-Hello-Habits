//
//  Hello_HabitsApp.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/15/23.
//

import SwiftUI

@main
struct Hello_HabitsApp: App {
    
    @StateObject private var habitController = HabitController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, habitController.container.viewContext)

        }
    }
}
