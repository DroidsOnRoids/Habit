//
//  ViewController.swift
//  Habit
//
//  Created by Piotr Sochalewski on 04/20/2016.
//  Copyright (c) 2016 Droids On Roids. All rights reserved.
//

import UIKit
import UserNotifications
import Habit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                print("Access granted: \(granted.description)")
            }
            
            let notification = UNMutableNotificationContent()
            notification.body = "Example notification"
            _ = notification.repeatEvery(.minute)
        } else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil))
            
            let notification = UILocalNotification()
            notification.alertBody = "Example notification"
            _ = notification.repeatEvery(.day(time: Date()))
            
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
}
