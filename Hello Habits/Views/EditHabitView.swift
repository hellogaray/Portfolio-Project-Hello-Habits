//
//  EditHabitView.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/12/23.
//

import SwiftUI

struct EditHabitView: View {
    @Environment(\.managedObjectContext) var manageObjContext
    @Environment(\.dismiss) var dismiss
    
    var habit: FetchedResults<Habit>.Element
    @State private var title = ""
    @State private var isReminderOn = false
    @State private var reminderTime = Date()
    @State private var selectedDays: [Int] = []
    

    // Constants for layout and design
    let daysOfWeek = Calendar.current.weekdaySymbols
    let dynamicOffset: CGFloat = -130
    let habitIcons = [
        "star.fill",
        "heart.fill",
        "circle.fill",
        "checkmark.circle.fill",
        "leaf.fill",
        "bolt.fill",
        "moon.fill",
        "sun.max.fill",
        "book.fill",
        "pencil.tip.crop.circle.fill"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Top Bar Section
                ZStack {
                    // Background ellipses and vectors
                    ZStack {
                        Image("ellipse13")
                        Image("ellipse14")
                        Image("ellipse12")
                        Image("ellipse11")
                        Image("ellipse10")
                    }
                    .edgesIgnoringSafeArea(.top)
                    .offset(y: dynamicOffset)
                    
                    // Top bar images and layout
                    Image("vector_01")
                    Image("vector_02")
                    Image("starBackground")
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    
                    // Vertical stack for top bar content
                    VStack(alignment: .center, spacing: 16) {
                        Spacer()
                        // Add any additional top bar content here
                        Spacer()
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding()
                }
                .frame(height: 250)
                
                // Habits Section
                VStack(alignment: .leading) {
                    // Introduction text
                    Section() {
                        Text("Create a habit!")
                            .font(.custom("Helvetica Neue", size: 36))
                            .foregroundColor(.secondaryBrand)
                            .bold()
                            .padding(.top)
                        
                        Text("Start a new habit! Take a small step.")
                            .font(.custom("Helvetica Neue", size: 18))
                            .fontWeight(.light)
                            .foregroundColor(Color("Regular Text"))
                            .padding(.bottom)
                    }
                    
                    // Habit title input
                    Section(header:
                        VStack() {
                            Text("Habit")
                                .font(.custom("Helvetica Neue", size: 22))
                                .bold()
                                .lineSpacing(24)
                                .foregroundColor(.secondaryBrand)
                        }
                    ) {
                        TextField("Habit Title", text: $title)
                            .onAppear {
                                title = habit.title!
                            }
                            .padding(.horizontal)
                            .frame(height: 40.0)
                            .cornerRadius(8)
                            .font(.custom("Helvetica Neue", size: 15))
                            .foregroundColor(.regularText)
                            .background(.fieldBackground)
                            .padding(.bottom)
                    }
                    
                    // Reminder settings
                    Section(header:
                        VStack(alignment: .leading) {
                            Toggle("Reminder", isOn: $isReminderOn)
                                .tint(Color("Primary Brand"))
                                .font(.custom("Helvetica Neue", size: 22))
                                .bold()
                                .lineSpacing(24)
                                .foregroundColor(.secondaryBrand)
                        }
                    ) {
                        DatePicker("", selection: $reminderTime, displayedComponents: .hourAndMinute )
                            .onAppear {
                                        isReminderOn = habit.isReminderOn
                                        reminderTime = habit.reminderTime ?? Date()
                                    }
                            .font(.custom("Helvetica Neue", size: 15))
                            .labelsHidden()
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(.fieldBackground)
                            .disabled(!isReminderOn)
                            .frame(maxWidth: .infinity)
                            .opacity(isReminderOn ? 1 : 0.1)
                            .padding(.bottom)
                    }
                    
                    // Habit frequency selection
                    Section(header:
                        Text("Frequency")
                            .font(.custom("Helvetica Neue", size: 22))
                            .bold()
                            .lineSpacing(24)
                            .foregroundColor(.secondaryBrand)
                    ) {
                        HStack(spacing: 0) {
                            let daysOfWeekAbbreviations = daysOfWeek.map { String($0.prefix(2)) }

                            // Display buttons for each day of the week
                            ForEach(daysOfWeekAbbreviations.indices, id: \.self) { index in
                                let dayAbbreviation = String(daysOfWeek[index].prefix(2))
                                Button(action: {
                                    if selectedDays.contains(index) {
                                        selectedDays.removeAll { $0 == index }
                                    } else {
                                        selectedDays.append(index)
                                    }
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(selectedDays.contains(index) ? .primaryBrand : .fieldBackground)
                                            .frame(width: 35, height: 35)

                                        Text(dayAbbreviation)
                                            .font(.custom("Helvetica Neue", size: 16))
                                            .foregroundColor(selectedDays.contains(index) ? .white : .regularText)
                                    }
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal, 8) // Adjust spacing between circles
                            }
                        }
                    }
                    .padding(.bottom)

                }
                .padding([.leading, .bottom, .trailing])
                
                // Bottom Bar Section
                VStack(alignment: .center, spacing: 10) {
                    // Submit button to add a new habit
                    Button("SUBMIT") {
                        let habitController = HabitController()
                        habitController.editHabit(
                            habit: habit,
                            title: title,
                            isReminderOn: isReminderOn,
                            reminderTime: isReminderOn ? reminderTime : nil,
                            selectedDays: selectedDays,
                            context: manageObjContext
                        )
                        dismiss()
                    }
                    .font(.custom("Helvetica Neue", size: 14))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.primaryBrand)
                    .cornerRadius(38)
                    
                    // Cancel button to dismiss the view
                    Button("CANCEL") {
                        dismiss()
                    }
                    .font(.custom("Helvetica Neue", size: 15))
                    .foregroundColor(.tertiaryBrand)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
            }
        }
    }
}
