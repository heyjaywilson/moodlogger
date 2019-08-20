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
}

extension MoodEntity {
    static func allMoodsFetchRequest() -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest() as! NSFetchRequest<MoodEntity>
        
        request.sortDescriptors = [NSSortDescriptor(key: "date_logged", ascending: true)]
        
        return request
    }
}
