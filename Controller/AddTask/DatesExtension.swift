//
//  DatesExtension.swift
//  ToDoList
//
//  Created by Youssef on 26/10/2021.
//
// operations that Related to task dates (start date or deadline)
// usefull article:- https://learnappmaking.com/swift-date-datecomponents-dateformatter-how-to/

import UIKit
extension AddTaskVC{
    func deadlineIsBeforStartDate() -> Bool {
        if deadlineDatePicker.date.timeIntervalSince(Date()).sign == FloatingPointSign.minus {
            return true
        }else{
            return false
        }
    }
    func getTextOfDeadlineDatePicker() -> String {
        let formatter = DateFormatter()
        formatter.calendar = deadlineDatePicker.calendar
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        let dateString = formatter.string(from:deadlineDatePicker.date)
        return dateString
    }
    func getCurrentDateAsString() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: currentDate)
        return dateString
    }
    func deadlineDatePicker_defaultForm() {
        deadlineDatePicker.setDate(Date(), animated: true)
        deadlineDatePicker.tintColor = #colorLiteral(red: 0.1908083257, green: 0.1908083257, blue: 0.1908083257, alpha: 1)
    }
    
}
