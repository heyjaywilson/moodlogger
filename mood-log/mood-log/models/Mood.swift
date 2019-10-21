//
//  Mood.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/8/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation

struct Mood {
    let mood: String
    let id: UUID
    let date: Date
    private let dateFormatter = DateFormatter()
    
    func returnMonth() -> String {
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: date)
    }
    
    func returnDay() -> String {
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
}
