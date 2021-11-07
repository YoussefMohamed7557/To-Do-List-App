//
//  TaskDetailsTVExtension.swift
//  ToDoList
//
//  Created by Youssef on 29/10/2021.
//
import UIKit
extension EditTaskVC:UITextViewDelegate{
    
    func taskDetailsTextView_IsEmpty() -> Bool {
        if taskDetailsTextView.text == "Task Details" || taskDetailsTextView.text == "" {
            return true
        }else{
            return false
        }
    }
    func getTextOftaskDetailsTextView() -> String{
        return taskDetailsTextView.text!
    }
    func taskDetailsTextView_defaultForm(){
        taskDetailsTextView.text = task?.details
        taskDetailsTextView.textColor = #colorLiteral(red: 0.1908083257, green: 0.1908083257, blue: 0.1908083257, alpha: 1)
    }
    // placeholder logic
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = #colorLiteral(red: 0.1908083257, green: 0.1908083257, blue: 0.1908083257, alpha: 1)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Task Details"
            textView.textColor = UIColor.lightGray
        }
    }
}

