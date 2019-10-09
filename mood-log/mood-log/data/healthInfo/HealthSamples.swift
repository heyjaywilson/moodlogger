//
//  HealthSamples.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/9/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation
import HealthKit

struct HKSamplesForDate{
    private let hkstore = HKHealthStore()
    private let hkAuth = HealthKitAuth()
    let date: Date
    
    func getSteps(completion: @escaping(Double) -> Void) {
        let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount)!
        let calendar = Calendar.current
        let newday = calendar.startOfDay(for: self.date)
        
        let predicate = HKQuery.predicateForSamples(withStart: newday, end: date, options: .strictStartDate)
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsQuery(quantityType: stepCount, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        
        hkstore.execute(query)
    }
}
