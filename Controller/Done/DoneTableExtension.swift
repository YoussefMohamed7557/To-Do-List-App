//
//  DoneTableExtension.swift
//  ToDoList
//
//  Created by Youssef on 31/10/2021.
//

import UIKit
extension DoneVC:UITableViewDelegate,UITableViewDataSource{
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
        taskInfoVCObject.sender = .Done
        taskInfoVCObject.doneReference = self
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(taskInfoVCObject, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCell = UIContextualAction(style: .normal, title: "Delete") { (action, view, nil) in
            self.removeTask(at: indexPath.row)
            self.doneTable.reloadData()
        }
        deleteCell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        deleteCell.image = #imageLiteral(resourceName: "pin")
        let perform = UISwipeActionsConfiguration(actions: [deleteCell])
        //to prevent first action when we hard swip
        //perform.performsFirstActionWithFullSwipe = false
        return perform
    }
}
