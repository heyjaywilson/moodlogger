//
//  LogRow.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct LogRow: View {
    @EnvironmentObject var health: HealthData
    @State private var month: String = ""
    @State private var day: String = ""
    @State private var steps: Double = 0.0
    var entry: MoodEntity
    var body: some View {
        HStack {
            VStack {
                Text(month)
                Text(day)
            }
            VStack {
                Text("\(entry.mood)")
                StepsSmall(steps: steps)
            }
        }.onAppear{
            self.formatDate()
            self.getStepData()
        }
    }
    
    func formatDate(){
        self.month = HelperFunctions().returnShortMonth(from: entry.date_logged)
        self.day = HelperFunctions().returnDay(from: entry.date_logged)
    }
    
    func getStepData() {
        health.getStepsFor(date: entry.date_logged)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let stringDate = formatter.string(from: entry.date_logged)
        let datelogged = formatter.date(from: stringDate)!
        print(datelogged)
        
        steps = health.steps[datelogged] ?? 0.0
    }
}

//struct LogRow_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    static var previews: some View {
//        LogRow(entry: MoodEntity(context: managedObjectContext))
//    }
//}
