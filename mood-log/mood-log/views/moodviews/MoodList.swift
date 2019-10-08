//
//  MoodList.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MoodList: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: MoodDetails()) {
                    MoodRow()
                }.isDetailLink(true)
                NavigationLink(destination: MoodDetails()) {
                    MoodRow()
                }.isDetailLink(true)
                NavigationLink(destination: MoodDetails()) {
                    MoodRow()
                }.isDetailLink(true)
            }
            .navigationBarTitle("Mood Log")
        }
    }
}

struct MoodList_Previews: PreviewProvider {
    static var previews: some View {
        MoodList()
    }
}
