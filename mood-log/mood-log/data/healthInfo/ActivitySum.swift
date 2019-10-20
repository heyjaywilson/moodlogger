//
//  ActivitySum.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/19/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation
import HealthKit

struct ActivitySum {
    var energyBurned: HKQuantity?
    var goalEnergy: HKQuantity?
    var exerciseTime: HKQuantity?
    var goalExercise: HKQuantity?
    var standHours: HKQuantity?
    var goalStand: HKQuantity?
    
    var energy: Double {
        get {
            return energyBurned?.doubleValue(for: HKUnit(from: .kilocalorie)) ?? 0.0
        }
    }
    
    var percentEnergy: Double {
        get {
            let ans = ((energyBurned?.doubleValue(for: HKUnit(from: .kilocalorie)) ?? 1.0)/(goalEnergy?.doubleValue(for: HKUnit(from: .kilocalorie)) ?? 1.0)) * 100
            if ans > 100.0 {
                return 100.0
            } else {
                return ans
            }
        }
    }
    
    var percentExercise: Double{
        get {
            let amt = exerciseTime?.doubleValue(for: HKUnit.minute()) ?? 1.0
            let goal = goalExercise?.doubleValue(for: HKUnit.minute()) ?? 1.0
            let ans = amt / goal * 100
            
            if ans > 100.0 {
                return 100.0
            }
            else {
                return ans
            }
        }
    }
    var percentStand: Double {
        get {
            let ans = standHours?.doubleValue(for: HKUnit.count()) ?? 1.0 / (goalStand?.doubleValue(for: HKUnit.count()) ?? 1.0) * 100
            
            if ans > 100.0 {
                return 100.0
            } else {
                return ans
            }
        }
    }
}
