//
//  AddTaskDelegationExtension.swift
//  ToDoList
//
//  Created by Youssef on 28/10/2021.
//

import UIKit
extension ToDoVC:AddTask{
    func pathNewTask(add theTask: Task) {
        
        tasksArr.append(theTask)
        namesArr.append(theTask.name)
        detailsArr.append(theTask.details)
        priorityArr.append(theTask.priority)
        startDatesArr.append(theTask.startDate)
        deadlinesArr.append(theTask.deadline)
        setInfoArraysBackup()
        
        toDoTable.reloadData()
    }
    
    
}

