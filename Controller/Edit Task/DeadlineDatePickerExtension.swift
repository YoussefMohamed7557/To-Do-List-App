//
//  DeadlineDatePickerExtension.swift
//  ToDoList
//
//  Created by Youssef on 29/10/2021.
//
// operations that Related to task dates (start date or deadline)
// usefull article:- https://learnappmaking.com/swift-date-datecomponents-dateformatter-how-to/

import UIKit
extension EditTaskVC{
    func deadlineIsBeforeStartDate() -> Bool {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        let startDate = formatter.date(from: task!.startDate)
        if deadlineDatePicker.date.timeIntervalSince(startDate!).sign == FloatingPointSign.minus {
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
    func deadlineDatePicker_defaultForm() {
        var initialDeadline = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        initialDeadline = formatter.date(from: task!.deadline )!
        deadlineDatePicker.date = initialDeadline
        deadlineDatePicker.tintColor = #colorLiteral(red: 0.1908083257, green: 0.1908083257, blue: 0.1908083257, alpha: 1)
    }
    
}
