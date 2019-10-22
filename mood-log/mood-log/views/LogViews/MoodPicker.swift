//
//  MoodPicker.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/21/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MoodPicker: View {
    @Binding var chosenMood: Int
    var moods: [String] = ["😀", "😁", "😂", "🤣", "😃", "😍", "🥰", "😴", "🤩", "🙃"]
    
    var body: some View {
        Picker(selection: $chosenMood, label: Text("Mood")) {
            ForEach(0 ..< moods.count){
                Text(self.moods[$0])
            }
        }
    }
}
