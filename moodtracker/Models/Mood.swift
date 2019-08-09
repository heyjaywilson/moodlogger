//
//  Mood.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/9/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation

struct Mood: Codable {
    let id: Int
    let date_logged: String
    let moods: [String]
}
