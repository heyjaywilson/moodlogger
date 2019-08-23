//
//  MoodForm.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI
import CoreData

struct MoodForm: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selection: Int = 0
    @State private var date_logged: Date = Date()
    
    let emojis: [String] = ["😀", "😁", "😂", "🤣", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎", "😍", "😘", "🥰", "😗", "😙", "😚", "☺️", "🙂", "🤗", "🤩", "🤔", "🤨", "😐", "😑", "😶", "🙄", "😏", "😣", "😥", "😮", "🤐", "😯", "😪", "😫", "😴", "😌", "😛", "😜", "😝", "🤤", "😒", "😓", "😔", "😕", "🙃", "🤑", "😲", "☹️", "🙁", "😖", "😞", "😟", "😤", "😢", "😭", "😦", "😧", "😨", "😩", "🤯", "😬", "😰", "😱", "🥵", "🥶", "😳", "🤪", "😵", "😡", "😠", "🤬", "😷", "🤒", "🤕", "🤢", "🤮", "🤧", "😇", "🤠", "🤡", "🥳", "🥴", "🥺", "🤥", "🤫", "🤭", "🧐", "🤓", "😈", "👿", "👹", "👺", "💀", "👻", "👽", "🤖", "💩", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿", "😾"]
    
    var body: some View {
        NavigationView{
            Form {
                Picker(selection: $selection, label: Text("Mood")) {
                    ForEach(0 ..< emojis.count){
                        Text(self.emojis[$0]).tag($0)
                    }
                }
                
                DatePicker(selection: $date_logged, displayedComponents: .date){
                    Text("Date")
                }
                
                DatePicker(selection: $date_logged, displayedComponents: .hourAndMinute){
                    Text("Time")
                }
                
            }
            .navigationBarTitle(Text("Select your Mood"))
            .navigationBarItems(
                leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Cancel")
                },
                trailing: Button(action: {
                    self.addMood()
                }){
                    Text("Add")
            })
        }
    }
    
    func addMood() {
        let help = HelperFunctions()
        var log: LogEntity!
        let logRequest:NSFetchRequest<LogEntity> = LogEntity.fetchRequest()
        logRequest.predicate = NSPredicate(format: "date ==%@", help.returnStringDate(from: date_logged))
        
        if let logs = try? managedObjectContext.fetch(logRequest){
            if logs.count > 0 {
                log = logs[0]
            }
        }
        
        if log == nil {
            let newLog = LogEntity(context: managedObjectContext)
            newLog.date = help.returnStringDate(from: date_logged)
            newLog.id = UUID()
            newLog.date_logged = help.returnDate(from: date_logged)
            log = newLog
        }
        
        // MOOD
        let mood = MoodEntity(context: managedObjectContext)
        mood.date_logged = self.date_logged
        mood.mood = self.emojis[self.selection]
        mood.id = UUID()
        mood.month = HelperFunctions().returnMonth(from: self.date_logged)
        mood.year = HelperFunctions().returnYear(from: self.date_logged)
        mood.log = log
        
        do {
            
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct MoodForm_Previews: PreviewProvider {
//    static var previews: some View {
//        MoodForm()
//    }
//}
