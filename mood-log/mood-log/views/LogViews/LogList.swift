//
//  MoodList.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MoodList: View {
    var moods: [Mood] = [Mood(mood: "😴", uuid: UUID(), date: Date())]
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: MoodDetails()) {
                    MoodRow(mood: moods[0])
                    }.isDetailLink(true)
            }
            .navigationBarTitle("Mood Log")
            .animation(.linear(duration: 2.0))
        }
    }
}

struct MoodList_Previews: PreviewProvider {
    static var previews: some View {
        MoodList()
    }
}
