//
//  DoneVC.swift
//  ToDoList
//
//  Created by Youssef on 30/10/2021.
//

import UIKit

class DoneVC: UIViewController {
    //MARK: - Constants and Variabels
    static let cellID = "TableViewCell"
    var namesArr:[String]=[]
    var detailsArr:[String]=[]
    var priorityArr:[String]=[]
    var startDatesArr:[String]=[]
    var deadlinesArr:[String]=[]
    var doneBackup : UserDefaults = UserDefaults()
    var task:Task?
    var tasksArr:[Task] = []
    //MARK: - OUTLETS
    @IBOutlet weak var doneTable: UITableView!
    @IBOutlet weak var doneSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startSettings()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        doneTable.reloadData()
    }
    //MARK: - Helper Methods
    func startSettings(){
        doneTable.register(UINib(nibName: ToDoVC.cellID, bundle: nil), forCellReuseIdentifier:ToDoVC.cellID)
        restoreInfoArrays()
        restore(TasksArr: &tasksArr)
        doneTable.reloadData()
    }
    func removeTask(at index:Int) {
        tasksArr.remove(at: index)
        namesArr.remove(at: index)
        detailsArr.remove(at: index)
        priorityArr.remove(at: index)
        startDatesArr.remove(at: index)
        deadlinesArr.remove(at: index)
        setInfoArraysBackup()
    }
    func setInfoArraysBackup(){
        doneBackup.set(namesArr, forKey: "DoneNamesArr")
        doneBackup.synchronize()
        doneBackup.set(detailsArr, forKey: "DoneDetailsArr")
        doneBackup.synchronize()
        doneBackup.set(priorityArr, forKey: "DonePriorityArr")
        doneBackup.synchronize()
        doneBackup.set(startDatesArr, forKey: "DoneStartDatesArr")
        doneBackup.synchronize()
        doneBackup.set(deadlinesArr, forKey: "DoneDeadlinesArr")
        doneBackup.synchronize()
        print("done setInfoArraysBackup")
    }
    func restoreInfoArrays() {
        guard doneBackup.array(forKey: "DoneNamesArr") != nil else { return }
        namesArr = doneBackup.array(forKey: "DoneNamesArr") as! [String]
        detailsArr = doneBackup.array(forKey: "DoneDetailsArr") as! [String]
        priorityArr = doneBackup.array(forKey: "DonePriorityArr") as! [String]
        startDatesArr = doneBackup.array(forKey: "DoneStartDatesArr") as! [String]
        deadlinesArr = doneBackup.array(forKey: "DoneDeadlinesArr") as! [String]
        print("done restoreInfoArrays")
    }
    func restore(TasksArr: inout[Task]) {
        TasksArr = []
        var temp:Task
        if namesArr.count-1 >= 0{
            for index in 0 ... namesArr.count-1{
                temp = Task(name: namesArr[index], details: detailsArr[index], priority: priorityArr[index],startDate:startDatesArr[index], deadline: deadlinesArr[index])
                TasksArr.append(temp)
                print("task \(index+1) is restored to done")
            }
        }
    }
}
