//
//  ContentView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var manageObjContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Habit.title, ascending: true)],
        animation: .default)
    private var habit: FetchedResults<Habit>

    @State private var showingAddView = false

    var body: some View {
        NavigationView {
            VStack {
                // Top view containing navigation elements
                ContentTopView()

                // Day view for navigating through days
                ContentDayView()

                // List of habits
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        ForEach(habit) { habit in
                            // Edit Card View 
                            NavigationLink(destination: EditHabitView(habit: habit)) {
                            
                            // Card view for each habit
                            HabitCardView(title: habit.title ?? "",
                                          isReminderEnabled: habit.isReminderOn,
                                          reminderTime: habit.reminderTime ?? Date(),
                                          selectedDays: habit.selectedDays ?? "")
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                }

                // Bottom view for adding new habits
                ContentBottomView(manageObjContext: _manageObjContext, showingAddView: $showingAddView)
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
