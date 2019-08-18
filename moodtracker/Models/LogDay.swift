//
//  LogDay.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/11/19.
//  Copyright © 2019 MW. All rights reserved.
//

import HealthKit

/*
 Description: Holds all moods and notes for a given day
 */
struct LogDay {
    let id: Int
    var moods: [Mood]
    var notes: [Note]
    var activity: HKActivitySummary?
    var date: String
    
    func returnAll(_ object: String) -> [String]{
        var returnObjs: [String] = []
        switch object {
        case "moods":
            let sortedMoods = self.moods.sorted(by: {$0.date_logged < $1.date_logged})
            for mood in sortedMoods {
                returnObjs.append(mood.mood)
            }
        default:
            let sortedNotes = self.notes.sorted(by: {$0.date_logged < $1.date_logged})
            for note in sortedNotes {
                returnObjs.append(note.text)
            }
        }
        
        return returnObjs
    }
}
