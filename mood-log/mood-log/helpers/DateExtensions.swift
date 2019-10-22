//
//  DateExtensions.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/9/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import Foundation

extension Date {
    func returnLongMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    func returnMonthAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self)
    }
    func returnDayAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    func returnDateAsString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MMM-dd"
        return dateFormatter.string(from: self)
    }
}
