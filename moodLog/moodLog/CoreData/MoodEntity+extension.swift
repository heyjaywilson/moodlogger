//
//  MoodEntity+extension.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/23/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import CoreData

extension MoodEntity {
    static func allMoodsFetchRequest() -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: false)]
        return request
    }
    
    static func moodsWithID(_ log_id: UUID) -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id MATCHES[c] '\(log_id)'")
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: false)]
        
        return request
    }
    
    /// Only shows moods with the given month
    static func moodsForMonth(_ month: String) -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest()
        request.predicate = NSPredicate(format: "month CONTAINS[c] '\(month)'")
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: false)]
        return request
    }
    
    static func moodsForYearMonth(_ month: String, _ year: String)  -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest()
        request.predicate = NSPredicate(format: "month CONTAINS[c] '\(month)' and year CONTAINS[c] '\(year)'")
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: false)]
        return request
    }
}
