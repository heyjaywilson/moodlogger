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
                MoodSmall(moods: mood.moods)
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
        formatter.dateFormat = "yyyy/MM/dd"
        let datelogged = formatter.date(from: "\(mood.date_logged)")
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
        switch dateComponents.month{
        case 1:
            self.month = "Jan"
        case 2:
            self.month = "Feb"
        case 3:
            self.month = "Mar"
        case 4:
            self.month = "Apr"
        case 5:
            self.month = "May"
        case 6:
            self.month = "Jun"
        case 7:
            self.month = "Jul"
        case 8:
            self.month = "Aug"
        case 9:
            self.month = "Sep"
        case 10:
            self.month = "Oct"
        case 11:
            self.month = "Nov"
        case 12:
            self.month = "Dec"
        default:
            self.month = "---"
        }
        self.day = "\(dateComponents.day!)"
    }
}
#if DEBUG
struct AllLogRow_Previews: PreviewProvider {
    static var previews: some View {
        AllLogRow(mood: Mood(id: 0, date_logged: "2019-08-19", moods: ["😃"]))
    }
}
#endif

