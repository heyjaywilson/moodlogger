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
    var entry: MoodEntity
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(month)
                    .fontWeight(.bold)
                Text(day)
            }
            VStack(alignment: .leading) {
                Text("\(entry.mood)")
                StepsSmall(steps: steps)
            }
        }.onAppear{
            self.formatDate()
            self.getStepData()
        }
    }
    
    func formatDate(){
        self.month = HelperFunctions().returnShortMonth(from: entry.date_logged)
        self.day = HelperFunctions().returnDay(from: entry.date_logged)
    }
    
    func getStepData() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy/MM/dd"
        let stringDate = formatter.string(from: entry.date_logged)
        let datelogged = formatter.date(from: stringDate)!
        let startDay = Calendar.current.startOfDay(for: datelogged)
        let predicate = HKQuery.predicateForSamples(withStart: startDay, end: entry.date_logged)
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
            print(resultCount)
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
