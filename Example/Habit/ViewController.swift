//
//  ViewController.swift
//  Habit
//
//  Created by Piotr Sochalewski on 04/20/2016.
//  Copyright (c) 2016 Droids On Roids. All rights reserved.
//

import UIKit
import Habit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = UILocalNotification()
        notification.alertBody = "Example notification"
        _ = notification.repeatEvery(.day(time: Date()))
        
        UIApplication.shared.scheduleLocalNotification(notification)
    }
}
