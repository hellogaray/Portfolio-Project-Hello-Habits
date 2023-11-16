//
//  AddHabitView.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/12/23.
//

import SwiftUI

struct CenteredBoldTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
    }
}

struct AddHabitView: View {
    @Environment(\.managedObjectContext) var manageObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var isReminderOn = false
    @State private var reminderTime = Date()
    @State private var selectedDays: [Int] = []
    
    let daysOfWeek = Calendar.current.weekdaySymbols
    
    var body: some View {
        NavigationView {
            VStack {
                // Top Bar Section
                ZStack {
                    Color(.secondarySystemBackground)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    
                    Image("vector_01")
                    Image("vector_02")
                    
                    Image("starBackground")
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    
                    VStack(alignment: .center, spacing: 16) {
                        Spacer()
                        
                        // Avatar and Greeting Section
                        HStack {
                            // Avatar
                            Image("ellieavatar")
                                .resizable()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                            
                            // Greeting and User Info
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Hello, \(Text("User").bold())!")
                                        .font(.custom("Poppins", size: 30))
                                        .foregroundColor(.primaryBrand)
                                }
                                
                                Text("email@email.com")
                                    .font(.custom("Poppins", size: 16))
                                    .foregroundColor(.tertiaryBrand)
                                    .fontWeight(.semibold)
                                
                                // Longest Streak
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 200, height: 64)
                                    .foregroundColor(Color.primaryBrand) // Yellow color
                                    .overlay(
                                        HStack {
                                            Image("lightningIcon")
                                                .aspectRatio(contentMode: .fill)
                                            
                                            VStack(spacing: 4) {
                                                Text("20 Days")
                                                    .font(.custom("Helvetica Neue", size: 24))
                                                    .bold()
                                                    .italic()
                                                    .foregroundColor(.white)
                                                
                                                
                                                Text("Longest Streak")
                                                // Replace with the dynamic streak value when available
                                                    .font(.custom("Helvetica Neue", size: 18))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.light)
                                            }
                                        }
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.primaryBrand, lineWidth: 5) // Add blue border with a width of 5
                                            )
                                            .blur(radius: 4) // Make the box blurrier
                                            .shadow(color: Color(Color.primaryBrand).opacity(0.25), radius: 4, x: 0, y: 0.5)
                                    )
                            }
                            .padding(.leading, 16)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding()
                }
                .frame(height: 250)
                .border(Color.black)
                
                // Habits Section
                VStack() {
                    Section(header: Text("Habit Title")) {
                        TextField("Habit Title", text: $title)
                    }
                    
                    Section(header: Text("Reminder")) {
                        Toggle("Enable Reminder", isOn: $isReminderOn)
                        if isReminderOn {
                            DatePicker("Reminder Time", selection: $reminderTime, displayedComponents: .hourAndMinute)
                        }
                    }
                    
                    Section(header: Text("Frequency")) {
                        ForEach(0..<daysOfWeek.count) { index in
                            Toggle(daysOfWeek[index], isOn: Binding(
                                get: { selectedDays.contains(index) },
                                set: { isSelected in
                                    if isSelected {
                                        selectedDays.append(index)
                                    } else {
                                        selectedDays.removeAll { $0 == index }
                                    }
                                }
                            ))
                        }
                    }
                }
                
                // Bottom Bar Section
                VStack(alignment: .center, spacing: 10) {
                    Button("Submit") {
                        let habitController = HabitController()
                        habitController.addHabit(
                            title: title,
                            isReminderOn: isReminderOn,
                            //reminderTime: isReminderOn ? reminderTime : nil,
                            //selectedDays: selectedDays, // Pass selected days
                            context: manageObjContext)
                        
                        dismiss()
                    }
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(.secondaryBrand)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(.secondaryBrand)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                }
                .border(Color.black)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
