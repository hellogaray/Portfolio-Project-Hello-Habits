//
//  EditHabitView.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/13/23.
//

import SwiftUI


struct EditHabitView: View {
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
                    
                    ZStack {
                        Image("ellipse13")
                        Image("ellipse14")
                        Image("ellipse12")
                        Image("ellipse11")
                        Image("ellipse10")
                    }
                    .edgesIgnoringSafeArea(.top)
                    .offset(y: -130)
                    
                    Image("vector_01")
                    Image("vector_02")
                    
                    Image("starBackground")
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    
                    VStack(alignment: .center, spacing: 16) {
                        Spacer()
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding()
                }
                .frame(height: 250)
                
                // Habits Section
                VStack(alignment: .leading) {
                    
                    Section() {
                        Text("Edit your habit!")
                            .font(.custom("Helvetica Neue", size: 36))
                            .foregroundColor(.secondaryBrand)
                            .bold()
                            .padding(.top)
                        
                        
                        Text("Need to make changes? We got you covered.")
                            .font(.custom("Helvetica Neue", size: 18))
                            .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("Regular Text"))
                            .padding(.bottom)
                    }
                    
                    
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
                            .padding(.horizontal)
                            .frame(height: 40.0)
                            .cornerRadius(8)
                            .font(.custom("Helvetica Neue", size: 15))
                            .foregroundColor(.regularText)
                            .background(.fieldBackground)
                            .padding(.bottom)
                    }
                    
                    
                    
                    
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
                    
                    
                    Section(header: Text("Frequency")
                        .font(.custom("Helvetica Neue", size: 22))
                        .bold()
                        .lineSpacing(24)
                        .foregroundColor(.secondaryBrand)) {
                            
                            HStack (spacing: 0){
                                ForEach(0..<daysOfWeek.count) { index in
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
                    
                    
                }
                .padding([.leading, .bottom, .trailing])

                
                // Bottom Bar Section
                VStack(alignment: .center, spacing: 10) {
                    Button("SAVE") {
                        let habitController = HabitController()
                        habitController.addHabit(
                            title: title,
                            isReminderOn: isReminderOn,
                            //reminderTime: isReminderOn ? reminderTime : nil,
                            //selectedDays: selectedDays, // Pass selected days
                            context: manageObjContext)
                        
                        dismiss()
                    }
                    .font(.custom("Helvetica Neue", size: 14))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.primaryBrand)
                    .cornerRadius(38)
                    
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


struct EditHabitView_Previews: PreviewProvider {
    static var previews: some View {
        EditHabitView()
    }
}

