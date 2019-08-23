//
//  LogRow.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI
import HealthKit

struct LogRow: View {
    @EnvironmentObject var health: HealthData
    @State private var month: String = ""
    @State private var day: String = ""
    @State private var steps: Double = 0.0
    var log: LogEntity
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(month)
                    .fontWeight(.bold)
                Text(day)
            }
            VStack(alignment: .leading) {
                Text("\(self.getMoods())")
                StepsSmall(steps: steps)
            }
        }.onAppear{
            self.formatDate()
            self.getStepData()
        }
    }
    func getMoods() -> String {
        var moods: String = ""
        for mood in log.moods!.allObjects as! [MoodEntity] {
            moods = moods + mood.mood!
        }
        return moods
    }
    func formatDate(){
        self.month = HelperFunctions().returnShortMonth(from: log.date_logged!)
        self.day = HelperFunctions().returnDay(from: log.date_logged!)
    }
    
    func getStepData() {
        let datelogged = log.date_logged!
        let startDay = Calendar.current.startOfDay(for: datelogged)
        let predicate = HKQuery.predicateForSamples(withStart: startDay, end: log.date_logged!)
        let sampleType:HKQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let query = HKStatisticsQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            var resultCount = 0.0
            
            guard let result = result else {
                print("\(String(describing: error))")
                return
            }
            
            if let sum = result.sumQuantity(){
                resultCount = sum.doubleValue(for: HKUnit.count())
            }
            
            DispatchQueue.main.async {
                self.steps = resultCount
            }
        }
        
        health.hkstore.execute(query)
    }
}

//struct LogRow_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    static var previews: some View {
//        LogRow(entry: MoodEntity(context: managedObjectContext))
//    }
//}
