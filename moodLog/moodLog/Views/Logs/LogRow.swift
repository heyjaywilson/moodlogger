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
            }
        }.onAppear{
            self.formatDate()
        }
    }
    
    func formatDate(){
        self.month = HelperFunctions().returnShortMonth(from: entry.date_logged)
        self.day = HelperFunctions().returnDay(from: entry.date_logged)
    }
}

//struct LogRow_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    static var previews: some View {
//        LogRow(entry: MoodEntity(context: managedObjectContext))
//    }
//}
