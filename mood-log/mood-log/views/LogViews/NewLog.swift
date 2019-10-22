//
//  NewLog.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/21/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct NewLog: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State private var logDate = Date()
    @State private var chosenMood: Int = 0
    private var moods: [String] = ["😀", "😁", "😂", "🤣", "😃", "😍", "🥰", "😴", "🤩", "🙃"]
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    DatePicker(selection: $logDate, displayedComponents: .date) {
                        Text("Log Date")
                    }
                    MoodPicker(chosenMood: $chosenMood)
                }
                Button(action:{
                    self.saveLog()
                }){
                    Text("Save")
                }
            }
            .navigationBarTitle("New Log")
            .navigationBarItems(trailing:
                Button(action: {
                    self.cancelLog()
                }) {
                    Text("Cancel")
            })
        }
    }
    func cancelLog(){
        presentationMode.wrappedValue.dismiss()
    }
    
    func saveLog() {
        var log: LogEntity = LogEntity(context: context)
        var results: [LogEntity] = []
        let request = LogEntity.logsForDate(date: logDate.returnDateAsString())

        do {
            results = try self.context.fetch(request)
        } catch{
            log.date = logDate
            log.stringDate = logDate.returnDateAsString()
            log.id = UUID()
            print("no matches")
        }
        
        if results.count > 0 {
            log = results[0]
        } else {
            log.date = logDate
            log.stringDate = logDate.returnDateAsString()
            log.id = UUID()
        }

        let newMood: MoodEntity = MoodEntity(context: context)
        newMood.date = logDate
        newMood.id = UUID()
        newMood.mood = moods[chosenMood]
        newMood.log = log
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewLog_Previews: PreviewProvider {
    static var previews: some View {
        NewLog()
    }
}
