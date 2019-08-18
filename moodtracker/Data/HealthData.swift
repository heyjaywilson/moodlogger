//
//  HealthData.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/15/19.
//  Copyright © 2019 MW. All rights reserved.
//

import HealthKit
import Combine
class HealthData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    let hkstore: HKHealthStore
    
    public var sleep: [HKCategorySample] = [] {
        willSet { self.objectWillChange.send() }
    }
    public var activity: [HKActivitySummary] = [] {
        willSet { self.objectWillChange.send() }
    }
    
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
        
        guard let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
            let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
            let bodyMassIndex = HKObjectType.quantityType(forIdentifier: .bodyMassIndex),
            let height = HKObjectType.quantityType(forIdentifier: .height),
            let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass),
            let sleep = HKObjectType.categoryType(forIdentifier: .sleepAnalysis),
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
                                                       activeEnergy,
                                                       sleep,
                                                       HKObjectType.activitySummaryType(),
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
    
    // - description: Used to get activity.
    func getActivityRings(forDay date: Date) {
        let calendar: Calendar = Calendar.autoupdatingCurrent
        
        var dateComponents: DateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        
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
                print(summary)
                print(summary.activeEnergyBurned.doubleValue(for: energyUnit))
                print(summary.appleStandHours.doubleValue(for: standUnit))
                print(summary.appleExerciseTime.doubleValue(for: exerciseUnit))
                
                self.activity.append(summary)
            }
        }
        
        hkstore.execute(query)
    }
    
    // - get matching activity
    func getActivity(forDay date: Date) -> HKActivitySummary {
        var i = 0;
        while i < activity.count {
            let calendar: Calendar = Calendar.autoupdatingCurrent
            
            var dateComponents: DateComponents = calendar.dateComponents([.year, .month, .day], from: date)
            
            dateComponents.calendar = calendar
            if activity[i].dateComponents(for: calendar) == dateComponents {
                return activity[i]
            }
            i = i + 1
        }
        
        return getActivity(forDay: dateΩ)
    }
    
    func getSleepAnalysis() {
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis){
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    
                    // Handle the error in your app gracefully
                    return
                    
                }
                
                if let result = tmpResult {
                    
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            
                            let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                            
                            print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                            self.sleep.append(sample)
                        }
                    }
                }
            }
            
            hkstore.execute(query)
        }
    }
}
