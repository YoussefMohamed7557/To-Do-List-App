//
//  TaskNameTFExtension.swift
//  ToDoList
//
//  Created by Youssef on 29/10/2021.
//
//  operations that Related to taskNameTF
import UIKit
extension EditTaskVC{
    
    func taskNameTF_IsEmpty() -> Bool {
        if taskNameTF.hasText{
            return false
        }else{
            return true
        }
    }
    func getTextOfTaskNameTF() -> String{
        return taskNameTF.text!
    }
    func TaskNameTF_defaultForm(){
        taskNameTF.text = task?.name
        taskNameTF.textColor = #colorLiteral(red: 0.1908083257, green: 0.1908083257, blue: 0.1908083257, alpha: 1)
    }
}
