//
//  BottomBarView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct ContentBottomView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var manageObjContext
    @Binding var showingAddView: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image("newHabitChevron")
            
            NavigationLink(destination: AddHabitView(manageObjContext: _manageObjContext), isActive: $showingAddView) {
                EmptyView()
            }
        
            Button("New Habit") {
                showingAddView.toggle()
            }
            .font(.custom("Helvetica Neue", size: 20))
            .foregroundColor(.secondaryBrand)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding()
    }
}


struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentBottomView(showingAddView: .constant(false))
            .previewLayout(.sizeThatFits)

    }
}
