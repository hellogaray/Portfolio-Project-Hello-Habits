//
//  LongestStreakBarView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 12/4/23.
//

import SwiftUI

struct LongestStreakBarView: View {
    var body: some View {
        // Rounded rectangle representing the longest streak bar
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 200, height: 64)
            .foregroundColor(Color.primaryBrand)
            .overlay(
                HStack {
                    // Lightning icon
                    Image("lightningIcon")
                        .aspectRatio(contentMode: .fill)
                    
                    VStack(spacing: 4) {
                        // Display the streak duration
                        Text("20 Days")
                            .font(.custom("Helvetica Neue", size: 24))
                            .bold()
                            .italic()
                            .foregroundColor(.white)
                        
                        // Display "Longest Streak" label
                        Text("Longest Streak")
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.light)
                    }
                }
            )
            .background(
                // Styling for the background of the bar
                RoundedRectangle(cornerRadius: 16)
                    .opacity(0.1)
                    .foregroundColor(.primaryBrand)
                    .overlay(
                        // Border styling for the bar
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.primaryBrand, lineWidth: 5)
                    )
                    .blur(radius: 5)
                    .shadow(color: Color(.primaryBrand).opacity(0.25), radius: 4, x: 0, y: 0.5)
            )
    }
}

struct LongestStreakBarView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview the LongestStreakBarView
        LongestStreakBarView()
            .previewLayout(.sizeThatFits)
    }
}
