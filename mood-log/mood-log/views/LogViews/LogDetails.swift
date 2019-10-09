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
    @State private var steps: Double = 0.0
    var body: some View {
        ScrollView{
            HStack{
                Text("MOODS: :) :D")
            }
            // Personal Info
            HStack{
                Text("Weight")
                Spacer()
                Text("212lbs")
            }
            // Activity
            HStack(alignment: .bottom){
                VStack{
                    HStack{
                        Text("Active Energy:")
                        Spacer()
                        Text("1")
                    }
                    HStack {
                        Text("Steps:")
                        Spacer()
                        Text("\(steps.string(fractionDigits: 0))")
                    }
                    HStack{
                        Text("Walk & Run Distance:")
                        Spacer()
                        Text("1")
                    }
                    HStack{
                        Text("Workouts:")
                        Spacer()
                        Text("1")
                    }
                    HStack{
                        Text("Exercise Minutes:")
                        Spacer()
                        Text("1")
                    }
                    HStack{
                        Text("Standing Minutes:")
                        Spacer()
                        Text("1")
                    }
                }
                ActivityChart()
            }
        }
        .navigationBarTitle(Text("Month Day, Year"), displayMode: .inline)
        .navigationBarItems(trailing: AddMood())
        .padding(.horizontal)
        .onAppear{
            self.getHealthInfo()
        }
    }
    
    func getHealthInfo(){
        let healthSamples = HKSamplesForDate(date: date)
        healthSamples.getSteps { sum in
            self.steps = sum
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
