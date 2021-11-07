//
//  TaskInfo_InProgressDelegationExtension.swift
//  ToDoList
//
//  Created by Youssef on 01/11/2021.
//

import UIKit
extension InProgressVC:MoveEditsToInProgressVC{
    func putEditted(task _task: Task, at index: Int) {
        self.removeTask(at: index)
        namesArr.insert(_task.name, at: index)
        detailsArr.insert(_task.details, at: index)
        priorityArr.insert(_task.priority, at: index)
        startDatesArr.insert(_task.startDate, at: index)
        deadlinesArr.insert(_task.deadline, at: index)
        tasksArr.insert(_task, at: index)
        setInfoArraysBackup()
        inProgressTable.reloadData()
    }
}
