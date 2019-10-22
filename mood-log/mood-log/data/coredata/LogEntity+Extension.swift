//
//  LogEntity+Extension.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/21/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation
import CoreData

extension LogEntity: Identifiable {
    static func allLogs() -> NSFetchRequest<LogEntity> {
        let request: NSFetchRequest<LogEntity> = LogEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        return request
    }
    
    static func logsForDate(date: String) -> NSFetchRequest<LogEntity> {
        let request: NSFetchRequest<LogEntity> = LogEntity.fetchRequest()
        request.predicate = NSPredicate(format: "stringDate == %@", date)
        return request
    }
}
