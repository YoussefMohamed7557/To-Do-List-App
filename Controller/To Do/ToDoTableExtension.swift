//
//  ToDoTableEtension.swift
//  ToDoList
//
//  Created by Youssef on 27/10/2021.
//  Opertations that related to To-DO table view

import UIKit
extension ToDoVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoVC.cellID, for: indexPath) as! TableViewCell
        cell.nameLabel.text = tasksArr[indexPath.row].name
        cell.startDateLabel.text! = "  Start: "+tasksArr[indexPath.row].startDate
        cell.deadlineLabel.text! = "  Deadline: "+tasksArr[indexPath.row].deadline
        
        if tasksArr[indexPath.row].priority == "High" {
            cell.priorityView.backgroundColor = UIColor.red
        }else if tasksArr[indexPath.row].priority == "Middle" {
            cell.priorityView.backgroundColor = UIColor.blue
        }else{
            cell.priorityView.backgroundColor = UIColor.green
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_HEIGHT/8
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskInfoVCObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TaskInfoVC") as! TaskInfoVC
        taskInfoVCObject.task = Task(name: namesArr[indexPath.row], details: detailsArr[indexPath.row], priority: priorityArr[indexPath.row], startDate: startDatesArr[indexPath.row], deadline: deadlinesArr[indexPath.row])
        taskInfoVCObject.taskIndex = indexPath.row
        taskInfoVCObject.sender = .ToDo
        taskInfoVCObject.toDoReference = self
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(taskInfoVCObject, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCell = UIContextualAction(style: .normal, title: "Delete") { (action, view, nil) in
            self.removeTask(at: indexPath.row)
            self.toDoTable.reloadData()
        }
        deleteCell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        deleteCell.image = #imageLiteral(resourceName: "pin")
        let perform = UISwipeActionsConfiguration(actions: [deleteCell])
        //to prevent first action when we hard swip
        //perform.performsFirstActionWithFullSwipe = false
        return perform
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let moveToInProgress = UIContextualAction(style: .normal, title: "InProgress") { (action, view, nil) in
            
            let viewControllers = self.tabBarController?.viewControllers
            let inprogressNavigationController = viewControllers![1]
            let inProgressVCObject = inprogressNavigationController.children.first as! InProgressVC
            inProgressVCObject.task = Task(name: self.namesArr[indexPath.row], details: self.detailsArr[indexPath.row], priority: self.priorityArr[indexPath.row], startDate: self.startDatesArr[indexPath.row], deadline: self.deadlinesArr[indexPath.row])
            inProgressVCObject.tasksArr.append(inProgressVCObject.task!)
            inProgressVCObject.namesArr.append(self.namesArr[indexPath.row])
            inProgressVCObject.detailsArr.append(self.detailsArr[indexPath.row])
            inProgressVCObject.startDatesArr.append(self.startDatesArr[indexPath.row])
            inProgressVCObject.deadlinesArr.append(self.deadlinesArr[indexPath.row])
            inProgressVCObject.priorityArr.append(self.priorityArr[indexPath.row])
            inProgressVCObject.setInfoArraysBackup()
            self.removeTask(at: indexPath.row)
            self.toDoTable.reloadData()
            print("move to in progress")
            
        }
        moveToInProgress.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        moveToInProgress.image = UIImage(systemName: "cursorarrow.rays")
        let moveToDone = UIContextualAction(style: .normal, title: "done") { (action, view, nil) in
           
            let viewControllers = self.tabBarController?.viewControllers
            let doneNavigationController = viewControllers![2]
            let doneVCObject = doneNavigationController.children.first as! DoneVC
            doneVCObject.task = Task(name: self.namesArr[indexPath.row], details: self.detailsArr[indexPath.row], priority: self.priorityArr[indexPath.row], startDate: self.startDatesArr[indexPath.row], deadline: self.deadlinesArr[indexPath.row])
            doneVCObject.tasksArr.append(doneVCObject.task!)
            doneVCObject.namesArr.append(self.namesArr[indexPath.row])
            doneVCObject.detailsArr.append(self.detailsArr[indexPath.row])
            doneVCObject.startDatesArr.append(self.startDatesArr[indexPath.row])
            doneVCObject.deadlinesArr.append(self.deadlinesArr[indexPath.row])
            doneVCObject.priorityArr.append(self.priorityArr[indexPath.row])
            doneVCObject.setInfoArraysBackup()
            self.removeTask(at: indexPath.row)
            self.toDoTable.reloadData()
            print("move to done")
        }
        moveToDone.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        moveToDone.image = UIImage(systemName: "hand.thumbsup.fill")
       
        let perform = UISwipeActionsConfiguration(actions: [moveToInProgress,moveToDone])
        //to prevent first action when we hard swip
        perform.performsFirstActionWithFullSwipe = false
        return perform
    }
}

