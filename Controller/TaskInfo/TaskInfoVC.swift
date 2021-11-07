//
//  TaskInfoVC.swift
//  ToDoList
//
//  Created by Youssef on 29/10/2021.
//

import UIKit

class TaskInfoVC: UIViewController {
    //MARK: - IBOtlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var taskPriorityLabel: UILabel!
    @IBOutlet weak var taskDetailsTextView: UITextView!{
        didSet{
            taskDetailsTextView.layer.cornerRadius = taskDetailsTextView.frame.height/10
        }
    }
    //MARK: - Variables and Constants
    var task:Task?
    var taskIndex:Int?
    var taskIsEddited = false
    var toDoReference:MoveEditsToToDoVC?
    var inProgressReference:MoveEditsToInProgressVC?
    var doneReference:MoveEditsToDoneVC?
    enum SenderCases {
        case ToDo,InProgress,Done;
    }
    var sender:SenderCases = .ToDo
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarContent()
        setScreenUI()
    }
    //MARK: - Helper Method
    func setScreenUI(){
        taskNameLabel.text = task?.name
        startDateLabel.text = task?.startDate
        deadlineLabel.text = task?.deadline 
        taskPriorityLabel.text = task?.priority
        taskDetailsTextView.text = task?.details
    }
    func setNavigationBarContent() {
        self.navigationItem.title = "Task Info"
        self.navigationItem.hidesBackButton = true
        let back = UIBarButtonItem(title: "< Back", style: .plain, target: self, action:#selector(self.backBtnAction)
        )
        let edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action:#selector(self.editeBtnAction)
        )
        self.navigationItem.setLeftBarButton(back, animated: true)
        self.navigationItem.setRightBarButton(edit, animated: true)
    }
    @objc func editeBtnAction() {
        let editTaskVCObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EditTaskVC") as! EditTaskVC
        editTaskVCObject.task = self.task
        editTaskVCObject.editTaskProtocolReference = self
        self.navigationController?.pushViewController(editTaskVCObject, animated: true)
    }
    @objc func backBtnAction() {
        if taskIsEddited{
            switch sender {
            case .ToDo:
                toDoReference?.putEditted(task: task!, at: taskIndex!)
                self.navigationController?.popViewController(animated: true)
            case .InProgress:
                inProgressReference?.putEditted(task: task!, at: taskIndex!)
                self.navigationController?.popViewController(animated: true)
            case .Done:
                doneReference?.putEditted(task: task!, at: taskIndex!)
                self.navigationController?.popViewController(animated: true)
            }
        }else{
            print("is not edited")
            self.navigationController?.popViewController(animated: true)
        }
      
    }
}
//"ToDo","InProgress","Done"
