//
//  ViewController.swift
//  ToDoList
//
//  Created by Youssef on 25/10/2021.
//

import UIKit

class ToDoVC: UIViewController {
    
    //MARK: - Constants and Variabels
    static let cellID = "TableViewCell"
    var namesArr:[String]=[]
    var detailsArr:[String]=[]
    var priorityArr:[String]=[]
    var startDatesArr:[String]=[]
    var deadlinesArr:[String]=[]
    var toDoBackup : UserDefaults = UserDefaults()
    var tasksArr:[Task] = []
    //MARK: - OUTLETS
    @IBOutlet weak var toDoTable: UITableView!
    @IBOutlet weak var ToDoSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startSettings()
    }
    //MARK: - IBActions
    @IBAction func goToAddTaskScreen(_ sender: Any) {
        let addTaskVC:AddTaskVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddTaskVC") as! AddTaskVC
        addTaskVC.addTaskProtocolReference = self
        self.navigationController?.pushViewController(addTaskVC, animated: true)
    }
    
    //MARK: - Helper Methods
    func startSettings(){
        toDoTable.register(UINib(nibName: ToDoVC.cellID, bundle: nil), forCellReuseIdentifier:ToDoVC.cellID)
        restoreInfoArrays()
        restore(TasksArr: &tasksArr)
        toDoTable.reloadData()
    }
    func removeTask(at index:Int) {
    
        namesArr.remove(at: index)
        detailsArr.remove(at: index)
        priorityArr.remove(at: index)
        startDatesArr.remove(at: index)
        deadlinesArr.remove(at: index)
        tasksArr.remove(at: index)
        setInfoArraysBackup()
    }
    func setInfoArraysBackup(){
        toDoBackup.set(namesArr, forKey: "toDoNamesArr")
        toDoBackup.synchronize()
        toDoBackup.set(detailsArr, forKey: "toDoDetailsArr")
        toDoBackup.synchronize()
        toDoBackup.set(priorityArr, forKey: "toDoPriorityArr")
        toDoBackup.synchronize()
        toDoBackup.set(startDatesArr, forKey: "toDoStartDatesArr")
        toDoBackup.synchronize()
        toDoBackup.set(deadlinesArr, forKey: "toDoDeadlinesArr")
        toDoBackup.synchronize()
        print("to do setInfoArraysBackup")
    }
    func restoreInfoArrays() {
        guard toDoBackup.array(forKey: "toDoNamesArr") != nil else { return }
        namesArr = toDoBackup.array(forKey: "toDoNamesArr") as! [String]
        detailsArr = toDoBackup.array(forKey: "toDoDetailsArr") as! [String]
        priorityArr = toDoBackup.array(forKey: "toDoPriorityArr") as! [String]
        startDatesArr = toDoBackup.array(forKey: "toDoStartDatesArr") as! [String]
        deadlinesArr = toDoBackup.array(forKey: "toDoDeadlinesArr") as! [String]
        print("to do restoreInfoArrays")
    }
    func restore(TasksArr: inout[Task]) {
        TasksArr = []
        var temp:Task
        if namesArr.count-1 >= 0{
            for index in 0 ... namesArr.count-1{
                temp = Task(name: namesArr[index], details: detailsArr[index], priority: priorityArr[index],startDate:startDatesArr[index], deadline: deadlinesArr[index])
                TasksArr.append(temp)
                print("task \(index+1) is restored to todo")
            }
        }
    }
}


