//
//  TestView.swift
//  Hello Habits
//
//  Created by Leonel Garay on 11/17/23.
//

import SwiftUI

struct ContentDayView: View {
    @State private var selectedDay = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedDay -= 1
                }) {
                    Image("leftarrow")
                }
                .disabled(selectedDay == -3)
                
                Spacer()
                
                VStack(spacing: 2) {
                    Text(dayNumber(for: selectedDay))
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text(dayTitle(for: selectedDay))
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button(action: {
                    selectedDay += 1
                }) {
                    Image("rightarrow")
                }
                .disabled(selectedDay == 3)
            }
            .padding()
        }
    }
    
    func dayNumber(for day: Int) -> String {
        let currentDate = Date()
        let dayDate = Calendar.current.date(byAdding: .day, value: day, to: currentDate) ?? currentDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: dayDate)
    }
    
    func dayTitle(for day: Int) -> String {
        let currentDate = Date()
        let dayDate = Calendar.current.date(byAdding: .day, value: day, to: currentDate) ?? currentDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: dayDate)
    }
}

struct ContentDayView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDayView()
    }
}
