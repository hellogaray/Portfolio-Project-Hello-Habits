//
//  ContentTopView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct ContentTopView: View {
    var body: some View {
        ZStack {
            // Background layers
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            
            Image("vector_01")
            Image("vector_02")
            
            // Star background layer
            Image("starBackground")
                .edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                
                // Avatar and Greeting Section
                HStack {
                    // Avatar
                    AvatarView()
                    
                    // Greeting and User Info
                    GreetingAndUserInfoView()
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: 200)
    }
}

struct ContentTopView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTopView()
            .previewLayout(.sizeThatFits)
    }
}
