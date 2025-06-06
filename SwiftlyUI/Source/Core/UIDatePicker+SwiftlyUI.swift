//
//  UIDatePicker+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UIDatePicker {
    @discardableResult
    func datePickerMode(_ mode: UIDatePicker.Mode) -> Self {
        self.datePickerMode = mode
        return self
    }
    
    @discardableResult
    func locale(_ locale: Locale?) -> Self {
        self.locale = locale
        return self
    }
    
    @discardableResult
    func calendar(_ calendar: Calendar) -> Self {
        self.calendar = calendar
        return self
    }
    
    @discardableResult
    func timeZone(_ timeZone: TimeZone?) -> Self {
        self.timeZone = timeZone
        return self
    }
    
    @discardableResult
    func date(_ date: Date) -> Self {
        self.date = date
        return self
    }
    
    @discardableResult
    func minimumDate(_ date: Date?) -> Self {
        self.minimumDate = date
        return self
    }
    
    @discardableResult
    func maximumDate(_ date: Date?) -> Self {
        self.maximumDate = date
        return self
    }
    
    @discardableResult
    func countDownDuration(_ duration: TimeInterval) -> Self {
        self.countDownDuration = duration
        return self
    }
    
    @discardableResult
    func minuteInterval(_ interval: Int) -> Self {
        self.minuteInterval = interval
        return self
    }
    
    @available(iOS 13.4, *)
    @discardableResult
    func preferredDatePickerStyle(_ style: UIDatePickerStyle) -> Self {
        self.preferredDatePickerStyle = style
        return self
    }
#if compiler(>=5.5)
    @available(iOS 15.0, *)
    @discardableResult
    func roundsToMinuteInterval(_ rounds: Bool) -> Self {
        self.roundsToMinuteInterval = rounds
        return self
    }
#endif
}

#endif
