//
//  LogRow.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct LogRow: View {
    var log: LogEntity
    
    private let dateFormatter = DateFormatter()
    
    @State private var healthSamples: HKSamplesForDate = HKSamplesForDate(date: Date())
    @State private var steps: Double = 0.0
    @State private var actSum: ActivitySum = ActivitySum()
    var body: some View {
        HStack(alignment: .center){
            VStack{
                Text(returnMonth())
                    .fontWeight(.heavy)
                Text(returnDay())
            }.padding(.trailing)
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
            ActivityChart(movePercent: actSum.percentEnergy, excePercent: actSum.percentExercise, stanPercent: actSum.percentStand)
        }.onAppear{
            self.getHealth()
        }
    }
    
    func getHealth(){
        healthSamples = HKSamplesForDate(date: log.date!)
        healthSamples.getSteps { sum in
            self.steps = sum
        }
        healthSamples.getActivity{ sum in
            self.actSum = sum
        }
    }
    
    func returnMonth() -> String{
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: log.date!)
    }
    func returnDay() -> String{
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: log.date!)
    }
}
