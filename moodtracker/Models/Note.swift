//
//  Note.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/11/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation

struct Note {
    var text: String
    var date_logged: Date
    
    func returnDateString() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let datelogged = formatter.string(from: self.date_logged)
        return datelogged
    }
}
