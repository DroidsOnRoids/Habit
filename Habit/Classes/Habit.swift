//
//  Habit.swift
//  Pods
//
//  Created by Piotr Sochalewski on 20.04.2016.
//  Copyright (c) 2016 Droids On Roids. All rights reserved.
//

import Foundation
import UIKit

/**
 The day of the weekday unit for the receiver.
 */
public enum Weekday: Int {
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    case sunday = 1
}

public enum NotificationBasis {
    /**
     The minute unit.
     
     Makes the notification delivered each round minute.
     */
    case minute
    
    /**
     The hour unit.
     
     Makes the notification delivered each round hour.
     */
    case hour
    
    /**
     The day unit.
     
     Makes the notification delivered each day at the time (an hour and a minute) given in the parameter.
     */
    case day(time: Date)
    
    /**
     The week unit.
     
     Makes the notification delivered weekly at the time (an hour and a minute) and weekday given in the parameter.
     */
    case week(time: Date, weekday: Weekday)
}

public extension UILocalNotification {
    /**
     Sets the calendar interval at which to reschedule the notification.
     
     Also sets the first date and time when the system should deliver the notification.
     
     @param basis: the unit for the repeat interval.
     */
    public func repeatEvery(_ basis: NotificationBasis) -> UILocalNotification {
        let calendar = NSCalendar.current

        timeZone = calendar.timeZone
        
        switch basis {
        case .minute:
            repeatInterval = .minute
            
            var components = calendar.dateComponents([.minute], from: Date())
            components.second = 0
            fireDate = calendar.date(from: components)?.addingTimeInterval(60)
            
        case .hour:
            repeatInterval = .hour
            
            var components = calendar.dateComponents([.hour], from: Date())
            components.minute = 0
            components.second = 0
            fireDate = calendar.date(from: components)?.addingTimeInterval(3600)
            
        case .day(let time):
            repeatInterval = .day
            fireDate = time.nextDate
            
        case .week(let time, let weekday):
            repeatInterval = .weekOfYear
            
            var components = calendar.dateComponents([.year, .hour, .minute, .weekOfYear], from: time)
            components.weekday = weekday.rawValue
            fireDate = calendar.date(from: components)?.nextDate
        }
        
        return self
    }
}

public extension Date {
    /**
     Returns the next date after the current date with given an hour and a minute.
     */
    public var nextDate: Date? {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.hour, .minute], from: self)
        
        return calendar.nextDate(after: Date(), matching: components, matchingPolicy: .nextTimePreservingSmallerComponents)
    }
}
