//
//  FormMood.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/12/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct FormMood: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var data: AllData
    
    @State private var newMood: Mood = Mood(mood: "😃", date_logged: Date())
    @State private var selection: Int = 0
    var emojis: [String] = ["😃", "😎", "🙁"]
    
    var body: some View {
        NavigationView{
            Form {
                Picker(selection: $selection, label: Text("Mood")) {
                    ForEach(0 ..< emojis.count){
                        Text(self.emojis[$0]).tag($0)
                    }
                }
            }
            .navigationBarTitle(Text("Select your Mood"))
            .navigationBarItems(
                leading:
                Button(action: {
                    self.presentation.value.dismiss()
                }){
                    Text("Cancel")
                },
                trailing: Button(action: {
                    self.addMood()
                    self.presentation.value.dismiss()
                }){
                    Text("Add")
            })
        }
    }
    
    func addMood() {
        newMood.mood = emojis[selection]
        data.add(mood: newMood)
    }
}

#if DEBUG
struct FormMood_Previews: PreviewProvider {
    @EnvironmentObject var data: AllData
    static var previews: some View {
        FormMood()
    }
}
#endif
