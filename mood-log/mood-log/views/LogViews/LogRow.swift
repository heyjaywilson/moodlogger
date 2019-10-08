//
//  LogRow.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogRow: View {
    var mood: Mood
    var body: some View {
        HStack(alignment: .center){
            VStack{
                Text(mood.returnMonth())
                    .fontWeight(.black)
                Text(mood.returnDay())
            }
            .padding(.trailing)
            VStack{
                Text("MOODS GO HERE").padding(.bottom)
                HStack(alignment: .center, spacing: 20) {
                    VStack {
                        Text("😴")
                        Text("7.5 Hrs")
                    }
                    VStack {
                        Text("🦶")
                        Text("15,892")
                    }
                }
            }
                .padding(.trailing)
            ActivityChart()
        }
    }
}

struct LogRow_Previews: PreviewProvider {
    static var previews: some View {
        LogRow(mood: Mood(mood: "😴", uuid: UUID(), date: Date()))
    }
}
