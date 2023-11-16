//
//  EditHabitView.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/13/23.
//

import SwiftUI

struct EditHabitView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var habit: FetchedResults<Habit>.Element
    
    @State private var title = ""
    @State private var isReminderOn = false
    
    var body: some View {
        Form {
            Section() {
                TextField("\(habit.title!)", text: $title)
                    .onAppear {
                        title = habit.title!
                    }
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        HabitController().editHabit(habit: habit, title: title, isReminderOn: isReminderOn, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}
