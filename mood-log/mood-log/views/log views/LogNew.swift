//
//  LogNew.swift
//  mood-log
//
//  Created by Maegan Wilson on 11/1/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogNew: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var logman: LogManager
    
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
        logman.addLog(date: logDate, mood: moods[chosenMood])
        presentationMode.wrappedValue.dismiss()
    }
}

struct LogNew_Previews: PreviewProvider {
    static var previews: some View {
        LogNew()
    }
}
