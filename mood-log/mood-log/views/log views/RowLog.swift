//
//  RowLog.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/30/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct RowLog: View {
  let moods = MoodManager()
  var log: LogEntity
  var body: some View {
    HStack{
      DateRow(month: getMonth(), day: getDay())
      VStack(alignment: .leading){
        Moods(moods: moods.getMood(log: log))
        HStack{
          SlotTwo()
          SlotThree()
        }
        HStack{
          SlotFour()
          SlotFive()
        }
      }
      SlotOne()
    }
  }
  
  func getMonth() -> String {
    guard let date = log.date else {
      return Date().returnShortMonth()
    }
    return date.returnShortMonth()
  }
  
  func getDay() -> String {
    guard let date = log.date else {
      return Date().returnDayAsString()
    }
    return date.returnDayAsString()
  }
}
