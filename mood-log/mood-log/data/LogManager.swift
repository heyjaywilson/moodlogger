//
//  LogManager.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/22/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation
import CoreData
import Combine

class LogManager: ObservableObject {
  let objectWillChange = ObservableObjectPublisher()
  let managedContext: NSManagedObjectContext
  
  public var allLogs: [LogEntity] = [] {
    willSet{
      self.objectWillChange.send()
    }
  }

// TODO: Don't initialize with ManagedObject Context
  
  init(mc: NSManagedObjectContext){
    managedContext = mc
    self.getAllLogs()
  }
  
  func getAllLogs(){
    if let fetched = try? managedContext.fetch(LogEntity.allLogs()){
      allLogs = []
      for log in fetched {
        if log.id != nil && log.date != nil{
          self.allLogs.append(log)
        }
      }
      allLogs.sort { $0.date! > $1.date! }
    }
  }
  
  func addLog(date: Date, mood: String){
    var exists: Bool = false
    var log: LogEntity = LogEntity(context: managedContext)
    for logged in allLogs {
      if logged.stringDate == date.returnDateAsString(){
        exists = true
        log = logged
      }
    }
    if exists == false {
      log.id = UUID()
      log.date = date
      log.stringDate = date.returnDateAsString()
    }
    
    let newMood = MoodEntity(context: managedContext)
    newMood.date = date
    newMood.id = UUID()
    newMood.mood = mood
    newMood.log = log
    
    do {
      try managedContext.save()
      if exists == false {
        allLogs.append(log)
      }
    } catch {
      print(error)
    }
    
    allLogs.sort { $0.date! > $1.date! }
  }
}
