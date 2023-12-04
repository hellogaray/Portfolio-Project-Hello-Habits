//
//  BottomBarView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct ContentBottomView: View {
    // Environment variables for dismissing and accessing managed object context
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var manageObjContext
    
    // Binding for showing the AddHabitView
    @Binding var showingAddView: Bool
    
    var body: some View {
        // Vertical stack containing the new habit chevron, "NEW HABIT" button, and navigation link
        VStack(alignment: .center, spacing: 0) {
            // Image for the new habit chevron
            Image("newHabitChevron")
            
            // NavigationLink to AddHabitView triggered by a hidden EmptyView
            NavigationLink(destination: AddHabitView(manageObjContext: _manageObjContext), isActive: $showingAddView) {
                EmptyView()
            }
        
            // Button to create a new habit
            Button("NEW HABIT") {
                showingAddView.toggle()
            }
            .font(.custom("Helvetica Neue", size: 14))
            .foregroundColor(.secondaryBrand)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
        }
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview the BottomBarView
        ContentBottomView(showingAddView: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
