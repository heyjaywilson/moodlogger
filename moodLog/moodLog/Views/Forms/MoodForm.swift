//
//  MoodForm.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

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
        let mood = MoodEntity(context: managedObjectContext)
        mood.date_logged = self.date_logged
        mood.mood = self.emojis[self.selection]
        mood.id = UUID()
        
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
