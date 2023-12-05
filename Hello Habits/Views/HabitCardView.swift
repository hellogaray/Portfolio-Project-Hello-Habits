//
//  HabitCardView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct HabitListView: View {
    var body: some View {
        // Vertical stack containing HabitCardViews in a scrollable view
        VStack {
            ScrollView {
                // Example of using HabitCardView with delete closure
                HabitCardView(title: "Running", isReminderEnabled: true, reminderTime: Date(), selectedDays: "2,4,6,7")
                
                HabitCardView(title: "Exercise", isReminderEnabled: false, reminderTime: Date(),  selectedDays: "0,1,2")
                
                HabitCardView(title: "Drink Tea", isReminderEnabled: true, reminderTime: Date(), selectedDays: "2")
                
                HabitCardView(title: "Exercise", isReminderEnabled: false, reminderTime: Date(),  selectedDays: "0,1,2")
                
                HabitCardView(title: "Walking the Dog", isReminderEnabled: true, reminderTime: Date(), selectedDays: "0,1,2,3,4,5,6")
                
                HabitCardView(title: "Meditate", isReminderEnabled: false, reminderTime: Date(),  selectedDays: "0,1,2,3,4,5,6")
                
                HabitCardView(title: "Morning Run", isReminderEnabled: false, reminderTime: Date(), selectedDays: "")
                
                HabitCardView(title: "Exercise Again", isReminderEnabled: false, reminderTime: Date(),  selectedDays: "0,1,2")
            }
        }
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview the HabitListView
        HabitListView()
            .previewLayout(.sizeThatFits)
    }
}

struct HabitCardView: View {
    // Properties to represent habit details
    var title: String
    var isReminderEnabled: Bool
    var reminderTime: Date
    var selectedDays: String
    
    // Days of the week abbreviations
    let daysOfWeekAbbreviations = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    
    // State to track habit completion
    @State var isCompleted = false
    
    @State private var isEditHabitViewPresented = false
    
    // Convert selectedDays string to an array of Int
    var selectedDaysString: [Int] {
        selectedDays.components(separatedBy: ",").compactMap { Int($0) }
    }
    
    var body: some View {
        // Horizontal stack containing habit details and completion button
        HStack  {
          
            // Habit Icon
            Image(systemName: "pencil.circle")
                .font(.title)
                .foregroundColor(.secondaryBrand)
                .frame(width: 50, height: 50)
                .padding()
            
            Spacer()
            
            // Habit Details
            VStack(alignment: .leading, spacing: 2) {
                // Title of the habit
                Text(title)
                    .font(.custom("Helvetica Neue", size: 16))
                    .foregroundColor(.secondaryBrand)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Days of the week and reminder details
                HStack {
                    Image(systemName: "bell")
                        .foregroundColor(.primaryBrand)
                    ForEach(0..<daysOfWeekAbbreviations.count, id: \.self) { index in
                        let dayAbbreviation = daysOfWeekAbbreviations[index]
                        Text(dayAbbreviation)
                            .font(.custom("Helvetica Neue", size: 12))
                            .foregroundColor(selectedDaysString.contains(index) ? .secondaryBrand : .light)
                    }
                }
                
                // Display reminder details if enabled
                if isReminderEnabled {
                    HStack {
                        Image(systemName: "repeat")
                            .foregroundColor(.primaryBrand)
                        Text("Reminder: \(reminderTime, formatter: timeFormatter)")
                            .font(.custom("Helvetica Neue", size: 12))
                            .foregroundColor(.secondaryBrand)
                    }
                } else {
                    // Display no reminder if not enabled
                    HStack {
                        Image(systemName: "repeat")
                            .foregroundColor(.secondaryBrand)
                            .opacity(0.5)
                        Text("Reminder: None")
                            .font(.custom("Helvetica Neue", size: 12))
                            .foregroundColor(.secondaryBrand)
                            .opacity(0.4)
                    }
                }
            }
            .alignmentGuide(.leading) { _ in 0 } // Align VStack contents to the left
            
            Spacer()
            
            // Toggle the isCompleted state when the button is tapped
            Button(action: {
                isCompleted.toggle()
            }) {
                // Display habit completion mark
                if !isCompleted {
                    Image("habitMark")
                        .foregroundColor(isCompleted ? .primaryBrand : .gray)
                }
            }
            .padding(.all)
            .background(Color.white.opacity(0.001))
        }
        .opacity(isCompleted ? 0.5 : 1.0)
        .background(
            // Rounded rectangle background with shadow
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.white)
                .shadow(color: Color(#colorLiteral(red: 0.2235294118, green: 0.2196078431, blue: 0.4549019608, alpha: 1)).opacity(0.25), radius: 1, x: 0, y: 0.5)
        )
        .padding(.horizontal)
    }
    
    // DateFormatter for displaying reminder time
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }
}

