//
//  AllData.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/11/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import Combine

class AllData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var moods: [Mood] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var notes: [Note] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var logs: [LogDay] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    func add(mood: Mood) {
        let date = mood.returnDateString()
        moods.append(mood)
        
        if self.logs .isEmpty {
            logs.append(LogDay(id: 1, moods: [mood], notes: [], date: date))
        } else {
            var breakOut = false
            var index = 0
            
            while !breakOut {
                if index > (self.logs.count) {
                    let newLog = LogDay(id: index+1, moods: [mood], notes: [], date: date)
                    breakOut = true
                    logs.append(newLog)
                }
                if self.logs[index].date == date {
                    self.logs[index].moods.append(mood)
                    breakOut = true
                }
                index += 1
            }
        }
    }
    
    func add(note: Note) {
        let date = note.returnDateString()
        notes.append(note)
        
        if self.logs .isEmpty {
            logs.append(LogDay(id: 1, moods: [], notes: [note], date: date))
        } else {
            var breakOut = false
            var index = 0
            
            while !breakOut {
                if index > (self.logs.count) {
                    let newLog = LogDay(id: index+1, moods: [], notes: [note], date: date)
                    breakOut = true
                    logs.append(newLog)
                }
                if self.logs[index].date == date {
                    self.logs[index].notes.append(note)
                    breakOut = true
                }
                index += 1
            }
        }
    }
}
