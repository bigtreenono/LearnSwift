//
//  DateExtension.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

// MARK: - Date extension

/// This extension add some useful functions to Date.
public extension Date {
    // MARK: - Variables
    
    /// Set and get current year.
    public var year: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.year], from: self)
            
            guard let year = components.year else {
                return 0
            }
            
            return year
        }
        set {
            update(components: [.year: newValue])
        }
    }
    
    /// Set and get current month.
    public var month: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.month], from: self)
            
            guard let month = components.month else {
                return 0
            }
            
            return month
        }
        set {
            update(components: [.month: newValue])
        }
    }
    
    /// Set and get current day.
    public var day: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.day], from: self)
            
            guard let day = components.day else {
                return 0
            }
            
            return day
        }
        set {
            update(components: [.day: newValue])
        }
    }
    
    /// Set and get current hour.
    public var hour: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.hour], from: self)
            
            guard let hour = components.hour else {
                return 0
            }
            
            return hour
        }
        set {
            update(components: [.hour: newValue])
        }
    }
    
    /// Set and get current minute.
    public var minute: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.minute], from: self)
            
            guard let minute = components.minute else {
                return 0
            }
            
            return minute
        }
        set {
            update(components: [.minute: newValue])
        }
    }
    
    /// Set and get current second.
    public var second: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.second], from: self)
            
            guard let second = components.second else {
                return 0
            }
            
            return second
        }
        set {
            update(components: [.second: newValue])
        }
    }
    
    /// Get current nanosecond.
    public var nanosecond: Int {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.nanosecond], from: self)
        
        guard let nanosecond = components.nanosecond else {
            return 0
        }
        
        return nanosecond
    }
    
    /// Get the weekday number from self.
    /// - 1 - Sunday.
    /// - 2 - Monday.
    /// - 3 - Tuerday.
    /// - 4 - Wednesday.
    /// - 5 - Thursday.
    /// - 6 - Friday.
    /// - 7 - Saturday.
    public var weekday: Int {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.weekday], from: self)
        
        guard let weekday = components.weekday else {
            return 0
        }
        
        return weekday
    }
    
    /// Editable date components.
    ///
    /// - year: Year component.
    /// - month: Month component.
    /// - day: Day component.
    /// - hour: Hour component.
    /// - minute: Minute component.
    /// - second: Second component.
    public enum EditableDateComponents: Int {
        case year
        case month
        case day
        case hour
        case minute
        case second
    }
    
    // MARK: - Functions
    
    /// Update current Date components.
    ///
    /// - Parameters:
    ///   - components: Dictionary of components and values to be updated.
    public mutating func update(components: [EditableDateComponents: Int]) {
        let autoupdatingCalendar = Calendar.autoupdatingCurrent
        var dateComponents = autoupdatingCalendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
        
        for (component, value) in components {
            switch component {
            case .year:
                dateComponents.year = value
            case .month:
                dateComponents.month = value
            case .day:
                dateComponents.day = value
            case .hour:
                dateComponents.hour = value
            case .minute:
                dateComponents.minute = value
            case .second:
                dateComponents.second = value
            }
        }
        
        let calendar = Calendar(identifier: autoupdatingCalendar.identifier)
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        self = date
    }
    
    /// Creates a Date object from year, month and day as Int.
    ///
    /// - Parameters:
    ///   - year: Year.
    ///   - month: Month.
    ///   - day: Day.
    ///   - hour: Hour.
    ///   - minute: Minute.
    ///   - second: Second.
    public init?(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        let calendar = Calendar.autoupdatingCurrent
        guard let date = calendar.date(from: components) else {
            return nil
        }
        self = date
    }
    
    /// Creates a Date object from a date String in a given format.
    ///
    /// - Parameters:
    ///   - dateString: Date String.
    ///   - format: Date String format. Default is "yyyy-MM-dd". Example: "2014-05-20".
    public init?(parse dateString: String, format: String="yyyy-MM-dd") {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        guard let parsed = dateFormatter.date(from: dateString) else {
            return nil
        }
        self = parsed
    }
    
    /// Create a Date with other two Date objects.
    /// Taken from the first date: day, month and year.
    /// Taken from the second date: hours and minutes.
    ///
    /// - Parameters:
    ///   - date: The first date for date.
    ///   - time: The second date for time.
    public init?(date: Date, time: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let datePortion: String = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "HH:mm"
        let timePortion: String = dateFormatter.string(from: time)
        
        let dateTime = "\(datePortion) \(timePortion)"
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        guard let parsed = dateFormatter.date(from: dateTime) else {
            return nil
        }
        self = parsed
    }
    
    /// Get the months number between self and another date.
    ///
    /// - Parameter toDate: The another date.
    /// - Returns: Returns the months between the two dates.
    public func monthsBetween(_ toDate: Date) -> Int {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.month], from: self, to: toDate)
        
        return abs(components.month!)
    }
    
    /// Get the days number between self and another date.
    ///
    /// - Parameter anotherDate: The another date.
    /// - Returns: Returns the days between the two dates.
    public func daysBetween(_ anotherDate: Date) -> Int {
        let time: TimeInterval = self.timeIntervalSince(anotherDate)
        return Int(abs(time / 60 / 60 / 24))
    }
    
    /// Returns if self is today.
    ///
    /// - Returns: Returns if self is today.
    public func isToday() -> Bool {
        return self.isSame(Date())
    }
    
    /// Compare self with another date.
    ///
    /// - Parameter anotherDate: The another date to compare as Date.
    /// - Returns: Returns true if is same day, otherwise false.
    public func isSame(_ anotherDate: Date) -> Bool {
        let calendar = Calendar.autoupdatingCurrent
        let componentsSelf = calendar.dateComponents([.year, .month, .day], from: self)
        let componentsAnotherDate = calendar.dateComponents([.year, .month, .day], from: anotherDate)
        
        return componentsSelf.year == componentsAnotherDate.year && componentsSelf.month == componentsAnotherDate.month && componentsSelf.day == componentsAnotherDate.day
    }
    
    /// Add days to self.
    ///
    /// - Parameter days: The number of days to add.
    /// - Returns: Returns self by adding the gived days number.
    public func addingDays(_ days: Int) -> Date? {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.date(byAdding: .day, value: days, to: self)
    }
    
    /// Add days to self.
    ///
    /// - Parameter days: The number of days to add.
    public mutating func addDays(_ days: Int) {
        guard let date = self.addingDays(days) else {
            return
        }
        self = date
    }
    
    /// Get the year string from self.
    ///
    /// - Returns: Get the year string from self.
    public func yearString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    /// Returns date with the year, month and day only.
    ///
    /// - Returns: Date after removing all components but not year, month and day.
    public func shortDate() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.year, .month, .day], from:self)
        
        return calendar.date(from: components)!
    }
    
    /// Check if the given date is less than self.
    ///
    /// - Parameter date: Date to compare.
    /// - Returns: Returns a true if self is greater than another one, otherwise false.
    public func isGreaterThan(_ date: Date) -> Bool {
        var isGreater = false
        if self.compare(date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        return isGreater
    }
    
    /// Check if the given date is greater than self.
    ///
    /// - Parameter date: Date to compare.
    /// - Returns: Returns a true if self is less than another one, otherwise false.
    public func isLessThan(_ date: Date) -> Bool {
        var isLess = false
        if self.compare(date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        return isLess
    }
    
    /// Just an alias for `isSame(_ anotherDate: Date)`.
    ///
    /// - Parameter date: Date to compare.
    /// - Returns: Returns a true if self is equal to another one, otherwise false.
    public func isEqual(_ date: Date) -> Bool {
        return self.isSame(date)
    }
    
    /// Create a Date with the yesterday date.
    ///
    /// - Returns: Returns a Date with the yesterday date.
    public func yesterday() -> Date {
        var date = self
        date.day = date.day - 1
        
        return date
    }
    
    /// Get weekday as a localized string from current weekday number.
    ///
    /// - Returns: Return weekday as a localized string.
    public func localizedWeekday() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: NSLocale.preferredLanguages.first!)
        
        return dateFormatter.string(from: self).capitalized
    }
    
    /// Get month as a localized string from current month.
    ///
    /// - Returns: Returns the given month as a localized string.
    public func localizedMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: NSLocale.preferredLanguages.first!)
        
        return dateFormatter.string(from: self).capitalized
    }
    
    /// Get the given Date structure as a formatted string.
    ///
    /// - Parameters:
    ///   - info: The Date to be formatted.
    ///   - dateSeparator: The string to be used as date separator. (Currently does not work on Linux).
    ///   - usFormat: Set if the timestamp is in US format or not.
    ///   - nanosecond: Set if the timestamp has to have the nanosecond.
    /// - Returns: Returns a String in the following format (dateSeparator = "/", usFormat to false and nanosecond to false). D/M/Y H:M:S. Example: 15/10/2013 10:38:43.
    public func description(dateSeparator: String = "/", usFormat: Bool = false, nanosecond: Bool = false) -> String {
        var description: String
        
        #if os(Linux)
            if usFormat {
                description = String(format: "%04li-%02li-%02li %02li:%02li:%02li", self.year, self.month, self.day, self.hour, self.minute, self.second)
            } else {
                description = String(format: "%02li-%02li-%04li %02li:%02li:%02li", self.month, self.day, self.year, self.hour, self.minute, self.second)
            }
        #else
            if usFormat {
                description = String(format: "%04li%@%02li%@%02li %02li:%02li:%02li", self.year, dateSeparator, self.month, dateSeparator, self.day, self.hour, self.minute, self.second)
            } else {
                description = String(format: "%02li%@%02li%@%04li %02li:%02li:%02li", self.month, dateSeparator, self.day, dateSeparator, self.year, self.hour, self.minute, self.second)
            }
        #endif
        
        if nanosecond {
            description += String(format: ":%03li", self.nanosecond / 1000000)
        }
        
        return description
    }
}
