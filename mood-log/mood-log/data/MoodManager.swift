//
//  MoodManager.swift
//  mood-log
//
//  Created by Maegan Wilson on 1/31/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import Foundation

struct MoodManager {
  
  func getMood(log: LogEntity) -> String{
    var moods: [MoodEntity] = []
    var stringMood = ""
    let moodsArray = Array<Any>(log.moods!)
    
    for mood in moodsArray{
      moods.append(mood as! MoodEntity)
    }
    moods.sort(by: { $0.date! < $1.date! })
    
    for mood in moods {
      stringMood += mood.mood ?? ""
    }
    
    return stringMood
  }
}
