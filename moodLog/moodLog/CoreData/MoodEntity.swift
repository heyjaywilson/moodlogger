//
//  MoodEntity.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import CoreData

public class MoodEntity: NSManagedObject, Identifiable {
    @NSManaged public var date_logged: Date
    @NSManaged public var id: UUID
    @NSManaged public var mood: String
    @NSManaged public var month: String?
    @NSManaged public var year: String?
}

extension MoodEntity {
    static func allMoodsFetchRequest() -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest() as! NSFetchRequest<MoodEntity>
        
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: false)]
        print(request)
        return request
    }
    
    /// Only shows moods with the given month
    static func moodsForMonth(_ month: String) -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest() as! NSFetchRequest<MoodEntity>
        request.predicate = NSPredicate(format: "month CONTAINS[c] '\(month)'")
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: false)]
        return request
    }
}
