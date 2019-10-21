//
//  LogList.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogList: View {
    var moods: [Mood] = [Mood(mood: "😄", id: UUID(), date: Date())]
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: LogDetails(date: Date())) {
                    LogRow(mood: moods[0])
                }.isDetailLink(true)
                NavigationLink(destination: LogDetails(date: Date())) {
                    LogRow(mood: moods[0])
                }.isDetailLink(true)
            }
            .navigationBarTitle("Log")
            .navigationBarItems(trailing: Button(action: { print("Add Log") }){
                Text("Add Log")
            })
            .animation(.linear(duration: 0.5))
        }
    }
}

struct LogList_Previews: PreviewProvider {
    static var previews: some View {
        LogList()
    }
}
