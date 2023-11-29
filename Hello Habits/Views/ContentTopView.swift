//
//  TopBarView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/16/23.
//
import SwiftUI
import CoreData


struct ContentTopView: View {
    var body: some View {
        ZStack {
            // Background layers
            Color(.secondarySystemBackground)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            
            Image("vector_01")
            Image("vector_02")
            
            Image("starBackground")
                .edgesIgnoringSafeArea(.top)
                .frame(height: 200)
            
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
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 200, height: 64)
                            .foregroundColor(Color.primaryBrand)
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
                                        /* TODO: Replace with the dynamic streak value when available */
                                            .font(.custom("Helvetica Neue", size: 18))
                                            .foregroundColor(.white)
                                            .fontWeight(.light)
                                    }
                                }
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .opacity(0.1)
                                    .foregroundColor(.primaryBrand)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(.primaryBrand, lineWidth: 5)
                                    )
                                    .blur(radius: 5)
                                    .shadow(color: Color(.primaryBrand).opacity(0.25), radius: 4, x: 0, y: 0.5)
                            )
                    }
                    .padding(.leading, 16)
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: 200)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTopView()
            .previewLayout(.sizeThatFits)
    }
}
