//
//  AllLogRow.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLogRow: View {
    @EnvironmentObject var data: AllData
    var logs: LogDay
    
    @State private var month = ""
    @State private var day = ""
    
    var body: some View {
        HStack(spacing: 25) {
            MonthDate(month: month, day: day)
            VStack(alignment: .leading){
                MoodSmall(moods: logs.moods)
                SleepSmall(amountSleep: 8.4)
                StepsSmall(steps: 10000)
            }.padding(.leading)
            
            VStack(alignment: .leading) {
                ActRingBar(typeBar: 0, size: 1, percent: getMovePercentage())
                ActRingBar(typeBar: 1, size: 1, percent: getActPercentage())
                ActRingBar(typeBar: 2, size: 1, percent: getStandPercentage())
            }.padding(.leading)
        }.onAppear {
            self.formatDate()
        }
    }
    
    func formatDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let datelogged = formatter.date(from: "\(logs.date)")
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
    func getMovePercentage() -> Double{
        let amt = logs.activity?.activeEnergyBurned.doubleValue(for: data.health.returnUnit(0)) ?? 0.0
        let goal = logs.activity?.activeEnergyBurnedGoal.doubleValue(for: data.health.returnUnit(0)) ?? 0.0
        if goal == 0 {
            return 0.0
        }
        return amt/goal * 100
    }
    
    func getActPercentage() -> Double {
        let amt = logs.activity?.appleExerciseTime.doubleValue(for: data.health.returnUnit(2)) ?? 0.0
        let goal = logs.activity?.appleExerciseTimeGoal.doubleValue(for: data.health.returnUnit(2)) ?? 0.0
        if goal == 0 {
            return 0.0
        }
        return amt/goal * 100
    }
    
    func getStandPercentage() -> Double {
        let amt = logs.activity?.appleStandHours.doubleValue(for: data.health.returnUnit(1)) ?? 0.0
        let goal = logs.activity?.appleStandHoursGoal.doubleValue(for: data.health.returnUnit(1)) ?? 0.0
        if goal == 0 {
            return 0.0
        }
        return amt/goal * 100
    }
}
#if DEBUG
struct AllLogRow_Previews: PreviewProvider {
    static var previews: some View {
        AllLogRow(logs: LogDay(id: 1, moods: [Mood(mood: "🙁", date_logged: Date())], notes: [Note(text: "HI", date_logged: Date())], date: "2019-08-01"))
    }
}
#endif

