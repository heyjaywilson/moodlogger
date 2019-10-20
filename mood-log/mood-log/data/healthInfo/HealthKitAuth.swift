//
//  HealthKitAuth.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/9/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitAuth {
    let hkstore = HKHealthStore()
    let healthToWrite: Set<HKSampleType> = []
    let healthToRead: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .bodyMass)!,
                                           HKObjectType.workoutType(),HKObjectType.activitySummaryType(),
                                           HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                                           HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
                                           HKObjectType.quantityType(forIdentifier: .appleStandTime)!,
                                           HKObjectType.quantityType(forIdentifier: .stepCount)!]
    var userAcceptedHealth: Bool
    
    init(){
        var temp = true
        hkstore.requestAuthorization(toShare: healthToWrite, read: healthToRead) { (success, error) in
            if success {
                temp = true
            } else {
                temp = false
            }
        }
        
        userAcceptedHealth = temp
    }
}
