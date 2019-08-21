//
//  LogRow.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct LogRow: View {
    @State private var month: String = ""
    @State private var day: String = ""
    
    var entry: MoodEntity
    var body: some View {
        HStack {
            VStack {
                Text(month)
                Text(day)
            }
            VStack {
                Text("\(entry.mood)")
                Text("Steps")
                Text("Sleep")
            }
        }.onAppear{
            self.formatDate()
        }
    }
    
    func formatDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = NSLocale.current
        
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second
        ]
        let userCalendar = Calendar.current
        let dateComponents = userCalendar.dateComponents(requestedComponents, from: self.entry.date_logged)
        let month: String = formatter.shortMonthSymbols[(dateComponents.month ?? 1)-1]
        let day: Int = dateComponents.day ?? 1
        self.month = month
        self.day = "\(day)"
    }
}

//struct LogRow_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    static var previews: some View {
//        LogRow(entry: MoodEntity(context: managedObjectContext))
//    }
//}
