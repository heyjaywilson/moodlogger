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
    
    func getWeight(completion: @escaping(Double) -> Void) {
        let bodymass = HKObjectType.quantityType(forIdentifier: .bodyMass)!
        
        let calendar = Calendar.current
        let newday = calendar.startOfDay(for: self.date)
        let predicate  = HKQuery.predicateForSamples(withStart: newday, end: date, options: .strictEndDate)
        let limit = 1
        
        let query = HKSampleQuery.init(sampleType: bodymass, predicate: predicate, limit: limit, sortDescriptors: nil) { (query, result, error) in
            guard let result = result
                else {
                    completion(0.0)
                    return
            }
            let res: Array<HKQuantitySample> = result as! Array<HKQuantitySample>
            if res.count > 0 {
                completion(0.0)
                return
            }
            print(res)
            completion(res[0].quantity.doubleValue(for: HKUnit(from: .pound)))
        }
        
        hkstore.execute(query)
    }
    
    func getActivity(completion: @escaping(ActivitySum) -> Void){
        let calendar = Calendar.current
        let beginDay = calendar.startOfDay(for: self.date)
        var begin = calendar.dateComponents(
            [ .year, .month, .day ],
            from: beginDay
        )
        begin.calendar = calendar
        
        var end = calendar.dateComponents([ .year, .month, .day ], from: date)
        end.calendar = calendar
        
        let predicate = HKQuery.predicate(forActivitySummariesBetweenStart: begin, end: end)
        
        let query = HKActivitySummaryQuery(predicate: predicate) { (query, summaries, error) in
            guard let summaries = summaries
                else {
                    print(error as Any)
                    completion(ActivitySum())
                    return
            }
            let sum = summaries[0]
            let activity: ActivitySum = ActivitySum(
                energyBurned: sum.activeEnergyBurned,
                goalEnergy: sum.activeEnergyBurnedGoal,
                exerciseTime: sum.appleExerciseTime,
                goalExercise: sum.appleExerciseTimeGoal,
                standHours: sum.appleStandHours,
                goalStand: sum.appleStandHoursGoal)
            completion(activity)
        }
        
        hkstore.execute(query)
    }
}
