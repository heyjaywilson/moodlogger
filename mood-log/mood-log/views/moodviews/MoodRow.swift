//
//  MoodRow.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MoodRow: View {
    var body: some View {
        HStack(alignment: .center){
            VStack{
                Text("month")
                    .fontWeight(.black)
                Text("day")
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

struct MoodRow_Previews: PreviewProvider {
    static var previews: some View {
        MoodRow()
    }
}
