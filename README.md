# Habit

[![Version](https://img.shields.io/cocoapods/v/Habit.svg?style=flat)](http://cocoapods.org/pods/Habit)
[![License](https://img.shields.io/cocoapods/l/Habit.svg?style=flat)](http://cocoapods.org/pods/Habit)
[![Platform](https://img.shields.io/cocoapods/p/Habit.svg?style=flat)](http://cocoapods.org/pods/Habit)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 2.x

## Installation

Habit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Habit"
```

## Usage

Habit lets you repeat notifications every minute, hour, day or week. It's pretty easy in use and after `UILocalNotification` initialization do just:
```swift
notification.repeatEvery(_:)
```

The parameter is `NotificationBasis` enum type. It lets you choose from:
* `Minute` – fires in next full minute and does it every 60 seconds,
* `Hour` – fires in next o'clock hour and does it every 60 minutes,
* `Day(time: NSDate)` – fires each day at parameter's time (a hour and a minute),
* `Week(time: NSDate, weekday: Weekday)` – fires every weekday at first parameter's time (a hour and a minute)

## Author

Piotr Sochalewski, piotr.sochalewski@droidsonroids.pl

## License

Habit is available under the MIT license. See the LICENSE file for more info.
