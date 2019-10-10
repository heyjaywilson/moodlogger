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
    @State private var healthSamples: HKSamplesForDate = HKSamplesForDate(date: Date())
    @State private var steps: Double = 0.0
    var body: some View {
        HStack(alignment: .center){
            VStack{
                Text(mood.date.returnMonthAsString())
                    .fontWeight(.black)
                Text(mood.date.returnDayAsString())
            }
            VStack(alignment: .center){
                Text("MOODS GO HERE")
                Spacer()
                HStack(alignment: .center, spacing: 20) {
                    VStack {
                        Text("😴")
                        Text("7.5 Hrs")
                    }
                    VStack {
                        Text("🦶")
                        Text("\(steps.string(fractionDigits: 0))")
                    }
                }
            }.padding(.vertical)
            Spacer()
            ActivityChart()
        }.onAppear{
            self.healthSamples = HKSamplesForDate(date: self.mood.date)
            self.healthSamples.getSteps { sum in
                self.steps = sum
            }
        }
    }
}

struct LogRow_Previews: PreviewProvider {
    static var previews: some View {
        LogRow(mood: Mood(mood: "😴", uuid: UUID(), date: Date()))
    }
}
