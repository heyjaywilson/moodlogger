//
//  AllLogRow.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLogRow: View {
    var mood: Mood
    
    @State private var month = ""
    @State private var day = ""
    
    var body: some View {
        HStack(spacing: 25) {
            MonthDate(month: month, day: day)
            VStack(alignment: .leading){
                MoodSmall(moods: [mood.mood])
                SleepSmall(amountSleep: 8.4)
                StepsSmall(steps: 10000)
            }.padding(.leading)
            
            VStack(alignment: .leading) {
                MoveSmall()
                ExerciseSmall()
                StandSmall()
            }.padding(.leading)
        }.onAppear {
            self.formatDate()
        }
    }
    
    func formatDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm"
        let datelogged = formatter.date(from: "\(mood.date_logged) \(mood.time_logged)")
        formatter.dateStyle = .medium
        print(datelogged)
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second
        ]
        let userCalendar = Calendar.current
        let dateComponents = userCalendar.dateComponents(requestedComponents, from: datelogged!)
        self.month = "\(dateComponents.month!)"
        self.day = "\(dateComponents.day!)"
    }
}
#if DEBUG
struct AllLogRow_Previews: PreviewProvider {
    static var previews: some View {
        AllLogRow(mood: Mood(date_logged: "2019-08-01", time_logged: "00:10", mood: "😃", note: "Happy enouch to put a smile"))
    }
}
#endif

