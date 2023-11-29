//
//  HabitCardView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct HabitListView: View {
    var body: some View {
        VStack {
            ScrollView {
                // Example of using HabitCardView with delete closure
                HabitCardView(title: "Running", frequency: "Daily", isReminderEnabled: true, reminderTime: "M T W F")
                
                HabitCardView(title: "Exercise", frequency: "Daily", isReminderEnabled: false, reminderTime: "M T W T F S S")
            }
        }
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
    }
}

struct HabitCardView: View {
    var title: String
    var frequency: String
    var isReminderEnabled: Bool
    var reminderTime: String
    @State private var selectedHour: Int = 0
    @State private var selectedMinute: Int = 0
    
    var body: some View {
        HStack  {
            // Habit Icon
            Image(systemName: "star")
                .font(.title)
                .foregroundColor(.secondaryBrand)
                .frame(width: 50, height: 50)
                .padding()
            
            Spacer()
            
            // Habit Details
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.custom("Helvetica Neue", size: 16))
                    .foregroundColor(.secondaryBrand)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Image(systemName: "bell")
                        .foregroundColor(.primaryBrand)
                    Text("Repeat: \(frequency)")
                        .font(.custom("Helvetica Neue", size: 12))
                        .foregroundColor(.secondaryBrand)
                        .opacity(0.5)
                }
                
                if isReminderEnabled {
                    HStack {
                        Image(systemName: "repeat")
                            .foregroundColor(.primaryBrand)
                        Text("Reminder: M T W T F S S")
                            .font(.custom("Helvetica Neue", size: 12))
                            .foregroundColor(.secondaryBrand)
                            .opacity(0.5)
                    }
                } else {
                    HStack {
                        Image(systemName: "repeat")
                            .foregroundColor(.secondaryBrand)
                            .opacity(0.5)
                        Text("Reminder: M T W T F S S")
                            .font(.custom("Helvetica Neue", size: 12))
                            .foregroundColor(.secondaryBrand)
                            .opacity(0.4)
                    }
                }
            }
            .alignmentGuide(.leading) { _ in 0 } // Align VStack contents to the left
            
            Spacer()
            
            // Checkmark
            Image("habitMark")
                .padding(.all)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.white)
                .shadow(color: Color(#colorLiteral(red: 0.2235294118, green: 0.2196078431, blue: 0.4549019608, alpha: 1)).opacity(0.25), radius: 1, x: 0, y: 0.5)
        )
        .padding(.horizontal)
    }
}
