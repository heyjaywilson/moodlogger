//
//  LogEntity_custom.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/23/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import CoreData

extension LogEntity{
    static func allLogRequest() -> NSFetchRequest<LogEntity>{
        let request: NSFetchRequest<LogEntity> = LogEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        return request
    }
}
