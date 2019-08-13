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
    
    var logs: [LogDay] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    func add(mood: Mood) {
        let date = mood.returnDateString()
        
        if self.logs .isEmpty {
            logs.append(LogDay(id: 1, moods: [mood], notes: [], date: date))
        } else {
            var breakOut = false
            var index = 0
            
            while !breakOut {
                if (index + 1) > (self.logs.count) || (self.logs.count == 0){
                    let newLog = LogDay(id: index+1, moods: [mood], notes: [], date: date)
                    breakOut = true
                    logs.append(newLog)
                } else {
                    
                    if self.logs[index].date == date {
                        self.logs[index].moods.append(mood)
                        self.logs[index].moods.sort{
                            $0.date_logged < $1.date_logged
                        }
                        breakOut = true
                    }
                    
                }
                index += 1
            }
        }
    }
    
    func add(note: Note) {
        let date = note.returnDateString()
        
        if self.logs .isEmpty {
            logs.append(LogDay(id: 1, moods: [], notes: [note], date: date))
        } else {
            var breakOut = false
            var index = 0
            
            while !breakOut {
                if (index + 1) > (self.logs.count) || (self.logs.count == 0) {
                    let newLog = LogDay(id: index+1, moods: [], notes: [note], date: date)
                    breakOut = true
                    logs.append(newLog)
                } else {
                    if self.logs[index].date == date {
                        self.logs[index].notes.append(note)
                        self.logs[index].notes.sort{
                            $0.date_logged < $1.date_logged
                        }
                        breakOut = true
                    }
                }
                
                index += 1
            }
        }
    }
}
