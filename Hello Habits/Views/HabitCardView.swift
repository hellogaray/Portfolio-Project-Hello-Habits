//
//  HabitCardView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct HabitCardView: View {
    var title: String
    var frequency: String
    var isReminderEnabled: Bool
    @State private var selectedHour: Int = 0
    @State private var selectedMinute: Int = 0
    
    var body: some View {
        HStack {
            // Icon
            Image(systemName: "star")
                .font(.title)
                .foregroundColor(.secondaryBrand)
                .frame(width: 75, height: 75)
                .padding()
            
            // Habit Details
            VStack(alignment: .leading, spacing: 8) {
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
                }
                
                if isReminderEnabled {
                    HStack {
                        Image(systemName: "repeat")
                            .foregroundColor(.primaryBrand)
                        Text("Reminder: 10:00pm")
                            .font(.custom("Helvetica Neue", size: 12))
                            .foregroundColor(.secondaryBrand)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.white)
                .shadow(color: Color(#colorLiteral(red: 0.2235294118, green: 0.2196078431, blue: 0.4549019608, alpha: 1)).opacity(0.25), radius: 4, x: 0, y: 0.5)
        )
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

