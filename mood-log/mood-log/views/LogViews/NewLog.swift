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
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker(selection: $logDate, displayedComponents: .date) {
                    Text("Log Date")
                }
            }
            .navigationBarTitle("New Note")
            .navigationBarItems(trailing:
                Button(action: {
                    self.saveLog()
                }) {
                    Text("Save")
            })
        }
    }
    
    func saveLog() {
        let newLog: LogEntity = LogEntity(context: context)
        newLog.date = logDate
        newLog.id = UUID()

        print(newLog)
        do {
            print(newLog)
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
