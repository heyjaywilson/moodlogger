//
//  LogDetials.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct AddMood: View {
    var body: some View {
        Button(action: { print("Add mood")}) {
            HStack{
                Image(systemName: "plus.app.fill")
                Text("Mood")
            }
        }
    }
}

struct LogDetails: View {
    var date: Date
    @State private var steps: Int = 0
    @State private var weight: Double = 120.0
    @State private var actSum: ActivitySum = ActivitySum()
    @State private var movePercent: Double = 0.0
    @State private var excerPercent: Double = 0.0
    @State private var standPercent: Double = 0.0
    var body: some View {
        VStack{
            List{
                Section(header: Text("Mood")){
                    VStack{
                        HStack{
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                            Text(":D")
                        }
                    }
                }
                Section(header: Text("Body")){
                    SingleHealthInfo(label: "Body Mass Index", amt: "34.44 BMI")
                    SingleHealthInfo(label: "Body Fat Percentage", amt: "34%")
                    SingleHealthInfo(label: "Weight", amt: "\(weight.string(fractionDigits: 2)) lbs")
                }
                Section(header: Text("Activity")) {
                    HStack(alignment: .center){
                        Text("Summary")
                        Spacer()
                        ActivityChart(movePercent: actSum.percentEnergy, excePercent: actSum.percentExercise, stanPercent: actSum.percentStand)
                    }
                    SingleHealthInfo(label: "Active Energy", amt: "\(actSum.energy.string(fractionDigits: 2)) cals")
                        .foregroundColor(.red)
                    SingleHealthInfo(label: "Steps", amt: "\(steps)")
                    SingleHealthInfo(label: "Walk & Run Distance", amt:"\(1290)")
                    SingleHealthInfo(label: "Exercise Minutes", amt: "\(actSum.exercise.string(fractionDigits: 2))")
                        .foregroundColor(.yellow)
                    SingleHealthInfo(label: "Workouts", amt: "3")
                    SingleHealthInfo(label: "Stand Hours", amt: "\(actSum.stand.string(fractionDigits: 0))")
                        .foregroundColor(.blue)
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle(Text("\(date.returnLongMonth()) \(date.returnDayAsString())"), displayMode: .large)
        .navigationBarItems(trailing: AddMood())
        .onAppear{
            self.getHealthInfo()
        }
    }
    
    func getHealthInfo(){
        let healthSamples = HKSamplesForDate(date: date)
        healthSamples.getSteps { sum in
            self.steps = Int(sum.rounded())
        }
        healthSamples.getWeight { weight in
            self.weight = weight
        }
        healthSamples.getActivity{ sum in
            self.actSum = sum
        }
    }
}

struct LogDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LogDetails(date: Date())
        }
    }
}
