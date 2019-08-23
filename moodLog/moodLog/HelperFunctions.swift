//
//  HelperFunctions.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/21/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation

struct HelperFunctions {
    let formatter = DateFormatter()
    let requestedComponents: Set<Calendar.Component> = [
        .year,
        .month,
        .day,
        .hour,
        .minute,
        .second
    ]
    let userCalendar = Calendar.current
    
    func returnYear(from date: Date) -> String {
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale.current
        
        let dateComponents = userCalendar.dateComponents(requestedComponents, from: date)
        let year = dateComponents.year ?? 0
        return "\(year)"
    }
    
    func returnMonth(from date:Date) -> String {
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale.current
        
        let dateComponents = userCalendar.dateComponents(requestedComponents, from: date)
        let month: String = formatter.monthSymbols[(dateComponents.month ?? 1)-1]
        return month
    }
    
    func returnShortMonth(from date: Date) -> String {
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale.current
        
        let dateComponents = userCalendar.dateComponents(requestedComponents, from: date)
        let month: String = formatter.shortMonthSymbols[(dateComponents.month ?? 1)-1]
        return month
    }
    
    func returnDay(from date:Date) -> String {
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale.current
        
        let dateComponents = userCalendar.dateComponents(requestedComponents, from: date)
        let day: Int = dateComponents.day ?? 1
        return "\(day)"
    }
    
    func returnDate(from date: Date) -> Date {
        formatter.dateFormat = "yyyy/MM/dd"
        let stringDate = formatter.string(from: date)
        return formatter.date(from: stringDate)!
    }
    
    func returnStringDate(from date: Date) -> String {
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: date)
    }
    
    func returnValue(_ value: Double, places: Int) -> String {
        if value > 0 {
            return String(format: "%.\(places)f", value)
        }
        
        return "No data available"
    }
}
