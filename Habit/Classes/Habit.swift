//
//  Habit.swift
//  Pods
//
//  Created by Piotr Sochalewski on 20.04.2016.
//  Copyright (c) 2016 Droids On Roids. All rights reserved.
//

import Foundation

/**
 The day of the weekday unit for the receiver.
 */
enum Weekday: Int {
    case Monday = 2
    case Tuesday = 3
    case Wednesday = 4
    case Thursday = 5
    case Friday = 6
    case Saturday = 7
    case Sunday = 1
}

enum NotificationBasis {
    /**
     The minute unit.
     Makes the notification delivered each round minute.
     */
    case Minute
    
    /**
     The hour unit.
     Makes the notification delivered each round hour.
     */
    case Hour
    
    /**
     The day unit.
     Makes the notification delivered each day at the time (an hour and a minute) given in the parameter.
     */
    case Day(time: NSDate)
    
    /**
     The week unit.
     Makes the notification delivered weekly at the time (an hour and a minute) and weekday given in the parameter.
     */
    case Week(time: NSDate, weekday: Weekday)
}

extension UILocalNotification {
    /**
     Sets the calendar interval at which to reschedule the notification.
     Also sets the first date and time when the system should deliver the notification.
     
     @param basis: the unit for 
     */
    func repeatEvery(basis: NotificationBasis) -> UILocalNotification {
        timeZone = NSCalendar.currentCalendar().timeZone
        
        let calendar = NSCalendar.currentCalendar()
        
        switch basis {
        case .Minute:
            repeatInterval = .Minute
            
            let components = calendar.components(.Minute, fromDate: NSDate())
            components.second = 0
            fireDate = calendar.dateFromComponents(components)?.dateByAddingTimeInterval(60)
            
        case .Hour:
            repeatInterval = .Hour
            
            let components = calendar.components(.Hour, fromDate: NSDate())
            components.minute = 0
            components.second = 0
            fireDate = calendar.dateFromComponents(components)?.dateByAddingTimeInterval(3600)
            
        case .Day(let time):
            repeatInterval = .Day
            fireDate = time.nextDate()
            
        case .Week(let time, let weekday):
            repeatInterval = .WeekOfYear
            
            let components = calendar.components([.Year, .Hour, .Minute, .WeekOfYear], fromDate: time)
            components.weekday = weekday.rawValue
            fireDate = calendar.dateFromComponents(components)?.nextDate()
        }
        
        return self
    }
}

extension NSDate {
    /**
     Returns the next date after the current date with given an hour and a minute.
     */
    func nextDate() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: self)
        
        return calendar.nextDateAfterDate(NSDate(), matchingComponents: components, options: .MatchNextTimePreservingSmallerUnits)
    }
}