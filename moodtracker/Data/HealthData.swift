//
//  HealthData.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/15/19.
//  Copyright © 2019 MW. All rights reserved.
//

import HealthKit

class HealthData {
    
    let hkstore: HKHealthStore
    
    init(){
        hkstore = HKHealthStore()
    }
    
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
    
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, HealthkitSetupError.notAvailableOnDevice)
            return
        }
        
        guard   let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
            let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
            let bodyMassIndex = HKObjectType.quantityType(forIdentifier: .bodyMassIndex),
            let height = HKObjectType.quantityType(forIdentifier: .height),
            let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass),
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
                
                completion(false, HealthkitSetupError.dataTypeNotAvailable)
                return
        }
        let healthKitTypesToWrite: Set<HKSampleType> = []
        let healthKitTypesToRead: Set<HKObjectType> = [dateOfBirth,
                                                       biologicalSex,
                                                       bodyMassIndex,
                                                       height,
                                                       bodyMass,
                                                       activeEnergy, HKObjectType.activitySummaryType(),
                                                       HKObjectType.workoutType()]
        HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) in
            completion(success, error)
        }
    }
    
    func getAgeAndSex() throws -> (age: Int, biologicalSex: HKBiologicalSex){
        do {
            let birthdayComponents = try hkstore.dateOfBirthComponents()
            let biologicalSex = try hkstore.biologicalSex()
            
            let today = Date()
            let calendar = Calendar.current
            let todayDateComponents = calendar.dateComponents([.year], from: today)
            
            let thisYear: Int = todayDateComponents.year!
            let age: Int = thisYear - birthdayComponents.year!
            
            let unwrappedBiologicalSex = biologicalSex.biologicalSex
            
            return (age, unwrappedBiologicalSex)
        }
    }
    
    func getActivityRings() {
        let calendar: Calendar = Calendar.autoupdatingCurrent
        
        var dateComponents: DateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        
        dateComponents.calendar = calendar
        let predicate: NSPredicate = HKQuery.predicateForActivitySummary(with: dateComponents)
        
        let query = HKActivitySummaryQuery(predicate: predicate) { (query, summaries, error) in
            guard let summaries = summaries, summaries.count > 0
                else {
                    return
            }
            let energyUnit = HKUnit.kilocalorie()
            let standUnit = HKUnit.count()
            let exerciseUnit = HKUnit.second()
            
            for summary in summaries {
                print(summary.activeEnergyBurned.doubleValue(for: energyUnit))
                print(summary.appleStandHours.doubleValue(for: standUnit))
                print(summary.appleExerciseTime.doubleValue(for: exerciseUnit))
            }
        }
        
        hkstore.execute(query)
    }
}
