import SwiftUI

struct HabitCardView: View {
    var title: String
    var frequency: String
    var isReminderEnabled: Bool

    var body: some View {
        HStack {
            // Small Image
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

struct HomeView: View {
    var body: some View {
        VStack {
            // Top Bar Section
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
                            
                            Text("useremail.com")
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
                                                .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
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
            
            // Habits Section
            VStack(alignment: .center, spacing: 16) {
                // Sample Habit Card
                HabitCardView(title: "Morning Run", frequency: "Everyday", isReminderEnabled: true)
                
                // Add more HabitCardViews for each habit in your list
                // HabitCardView(title: "Example Habit", frequency: "Weekly", isReminderEnabled: false)
                // ...
            }
            .padding()
            .background(Color(.systemBackground))
            
            // Bottom Bar Section
            VStack(alignment: .center, spacing: 0) {
                Image("newHabitChevron")
                
                Button("New Habit") {
                    // Placeholder for action - Add your code here
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .font(.custom("Helvetica Neue", size: 20))
                .foregroundColor(.secondaryBrand)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
            }
            .border(Color.black)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
