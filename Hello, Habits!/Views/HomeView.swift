//
//  Home.swift
//  Hello, Habits!
//
//  Created by Leonel Garay on 11/7/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
    var body: some View {
        
        // Top Bar Section
        ZStack {
            // Background Color
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(.top) // Ignore safe area to fill entire screen
                .frame(height: 250) // Fixed height of the top bar
            
            // Decorative Images
            Image("vector_01")
            Image("vector_02")
            
            // Star Background ignoring top safe area
            Image("starBackground")
                .edgesIgnoringSafeArea(.top)
                .frame(height: 250)
            
            // Vertical Stack for Top Bar Content
            VStack(alignment: .center, spacing: 0) {
                // Title: "Habits"
                Text("Habits")
                    .font(.custom("Helvetica Nue", size: 20))
                    .foregroundColor(.primaryBrand)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity) // Expand to maximum width
                    .overlay(alignment: .trailing) {
                        // Settings Gear Button
                        Button {
                            // Handle button tap
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
            }
            .frame(maxHeight: .infinity, alignment: .top) // Expand vertically to maximum height
            .padding() // Add general padding for internal content
        }
        .frame(height: 250) // Main content frame height
        //.border(Color.black) // REMOVE LATER
        
        // Habits
        VStack(alignment: .center, spacing: 0) {
            Text("Habits/Message Placeholder")
        }
        .frame(maxWidth: .infinity) // Expand to maximum width
        //.border(Color.black) // REMOVE LATER
        
        // Bottom Bar Section
        VStack(alignment: .center, spacing: 0) {
            // Icon: New Habit Chevron
            Image("newHabitChevron")
            
            // Button: New Habit
            Button("New Habit") {
                // Placeholder for action - Add your code here
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .font(.custom("Helvetica Nue", size: 20))
            .foregroundColor(.secondaryBrand)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity) // Expand to maximum width
        }
        //.border(Color.black) // REMOVE LATER
        .frame(maxHeight: .infinity, alignment: .bottom) // Expand vertically to maximum height, align to bottom
    }
}

#Preview {
    ContentView()
}
