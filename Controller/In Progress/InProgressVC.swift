//
//  InProgressVC.swift
//  ToDoList
//
//  Created by Youssef on 30/10/2021.
//

import UIKit

class InProgressVC: UIViewController {
    //MARK: - Constants and Variabels
    static let cellID = "TableViewCell"
    var namesArr:[String]=[]
    var detailsArr:[String]=[]
    var priorityArr:[String]=[]
    var startDatesArr:[String]=[]
    var deadlinesArr:[String]=[]
    var inPrpgressBackup : UserDefaults = UserDefaults()
    var task:Task?
    var tasksArr:[Task] = []
    
    //MARK: - OUTLETS
    @IBOutlet weak var inProgressTable: UITableView!
    @IBOutlet weak var inProgressSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         startSettings()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        inProgressTable.reloadData()
    }
    //MARK: - Helper Methods
    func startSettings(){
        inProgressTable.register(UINib(nibName: ToDoVC.cellID, bundle: nil), forCellReuseIdentifier:ToDoVC.cellID)
        restoreInfoArrays()
        restore(TasksArr: &tasksArr)
        inProgressTable.reloadData()
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
        inPrpgressBackup.set(namesArr, forKey: "InProgressNamesArr")
        inPrpgressBackup.synchronize()
        inPrpgressBackup.set(detailsArr, forKey: "InProgressDetailsArr")
        inPrpgressBackup.synchronize()
        inPrpgressBackup.set(priorityArr, forKey: "InProgressPriorityArr")
        inPrpgressBackup.synchronize()
        inPrpgressBackup.set(startDatesArr, forKey: "InProgressStartDatesArr")
        inPrpgressBackup.synchronize()
        inPrpgressBackup.set(deadlinesArr, forKey: "InProgressDeadlinesArr")
        inPrpgressBackup.synchronize()
        print("in progress setInfoArraysBackup")
    }
    func restoreInfoArrays() {
        guard inPrpgressBackup.array(forKey: "InProgressNamesArr") != nil else { return }
        namesArr = inPrpgressBackup.array(forKey: "InProgressNamesArr") as! [String]
        detailsArr = inPrpgressBackup.array(forKey: "InProgressDetailsArr") as! [String]
        priorityArr = inPrpgressBackup.array(forKey: "InProgressPriorityArr") as! [String]
        startDatesArr = inPrpgressBackup.array(forKey: "InProgressStartDatesArr") as! [String]
        deadlinesArr = inPrpgressBackup.array(forKey: "InProgressDeadlinesArr") as! [String]
        print("in progress restoreInfoArrays")
    }
    func restore(TasksArr: inout[Task]) {
        TasksArr = []
        var temp:Task
        if namesArr.count-1 >= 0{
            for index in 0 ... namesArr.count-1{
                temp = Task(name: namesArr[index], details: detailsArr[index], priority: priorityArr[index],startDate:startDatesArr[index], deadline: deadlinesArr[index])
                TasksArr.append(temp)
                print("task \(index+1) is restored to in progress")
            }
        }
    }
}
