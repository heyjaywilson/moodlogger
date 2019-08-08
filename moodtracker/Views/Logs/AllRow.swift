//
//  AllRow.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllRow: View {
    var body: some View {
        HStack {
            // Date
            VStack {
                Text("Aug")
                Text("01")
            }
            // Mood and sleep
            VStack{
                HStack {
                    Text("🙁")
                    Text("😐")
                    Text("😃")
                }
                // Sleep
                HStack {
                    Text("💤: 6.5 hours")
                }
                // Mindful Minutes
                HStack {
                    Text("Mindful Minutes: 5 minutes")
                }
            }
            // Activity
            VStack {
                HStack {
                    Text("M")
                    Rectangle().foregroundColor(.red)
                }
                HStack {
                    Text("E")
                    Rectangle().foregroundColor(.green)
                }
                HStack {
                    Text("S")
                    Rectangle().foregroundColor(.blue)
                }
            }
        }
    }
}

#if DEBUG
struct AllRow_Previews: PreviewProvider {
    static var previews: some View {
        AllRow()
    }
}
#endif
