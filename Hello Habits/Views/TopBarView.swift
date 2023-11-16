//
//  TopBarView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 250)
            
            Image("vector_01")
            Image("vector_02")
            
            Image("starBackground")
                .edgesIgnoringSafeArea(.top)
                .frame(height: 250)
            
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                
                // Avatar and Greeting Section
                HStack {
                    // Avatar
                    Image("ellieavatar")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                    
                    // Greeting and User Info
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Hello, \(Text("User").bold())!")
                                .font(.custom("Poppins", size: 30))
                                .foregroundColor(.primaryBrand)
                        }
                        
                        Text("email@email.com")
                            .font(.custom("Poppins", size: 16))
                            .foregroundColor(.tertiaryBrand)
                            .fontWeight(.semibold)
                        
                        // Longest Streak
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 200, height: 64)
                            .foregroundColor(Color.primaryBrand) // Yellow color
                            .overlay(
                                HStack {
                                    Image("lightningIcon")
                                        .aspectRatio(contentMode: .fill)
                                    
                                    VStack(spacing: 4) {
                                        Text("20 Days")
                                            .font(.custom("Helvetica Neue", size: 24))
                                            .bold()
                                            .italic()
                                            .foregroundColor(.white)

                                        
                                        Text("Longest Streak")
                                            // Replace with the dynamic streak value when available
                                            .font(.custom("Helvetica Neue", size: 18))
                                            .foregroundColor(.white)
                                            .fontWeight(.light)
                                    }
                                }
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.primaryBrand, lineWidth: 5) // Add blue border with a width of 5
                                    )
                                    .blur(radius: 4) // Make the box blurrier
                                    .shadow(color: Color(Color.primaryBrand).opacity(0.25), radius: 4, x: 0, y: 0.5)
                            )
                    }
                    .padding(.leading, 16)
                }
                .frame(maxWidth: .infinity)
    
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        }
        .frame(height: 250)
        .border(Color.black)
    }
}


struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
            .previewLayout(.sizeThatFits)

    }
}
