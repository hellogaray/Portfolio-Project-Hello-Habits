//
//  GreetingAndUserInfoView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 12/4/23.
//

import SwiftUI

struct GreetingAndUserInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Hello,")
                    .font(.custom("Helvetica Neue", size: 24))
                    .foregroundColor(.secondaryBrand)

                /* TODO: Replace with the dynamic streak value when available */
                Text("Username")
                    .bold()
                    .font(.custom("Helvetica Neue", size: 24))
                    .foregroundColor(.secondaryBrand)
            }

            // Longest Streak Bar
            LongestStreakBarView()
        }
    }
}

struct GreetingAndUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingAndUserInfoView()
            .previewLayout(.sizeThatFits)
    }
}
