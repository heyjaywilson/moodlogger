//
//  Mood.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/9/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation

struct Mood: Codable {
    let date_logged: String
    let time_logged: String
    let mood: String
    let note: String
}
