//
//  MoveEditsExtension.swift
//  ToDoList
//
//  Created by Youssef on 30/10/2021.
//

import UIKit
extension TaskInfoVC:MoveEditsToTaskInfoVC{
    func pathTask(edits theTask: Task) {
        self.taskIsEddited = true
        self.task = theTask
        self.setScreenUI()
    }

}
