//
//  HealthData.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/22/19.
//  Copyright © 2019 MW. All rights reserved.
//

import HealthKit
import Combine
class HealthData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    let hkstore: HKHealthStore
    
    public var steps: [Date:Double] = [:]{
        willSet { self.objectWillChange.send() }
    }
    
    init() {
        hkstore = HKHealthStore()
    }
    
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
    
    func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
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
            let steps = HKObjectType.quantityType(forIdentifier: .stepCount),
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
                                                       steps,
                                                       HKObjectType.activitySummaryType(),
                                                       HKObjectType.workoutType()]
        hkstore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) in
            completion(success, error)
        }
    }
    
    func getStepsFor(date: Date)  {
        let datelogged = HelperFunctions().returnDate(from: date)
        let startDay = Calendar.current.startOfDay(for: datelogged)
        let predicate = HKQuery.predicateForSamples(withStart: startDay, end: date)
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
                self.steps[datelogged] = resultCount
            }
            
        }
        
        hkstore.execute(query)
    }
}
