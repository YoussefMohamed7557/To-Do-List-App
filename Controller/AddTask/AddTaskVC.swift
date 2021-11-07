//
//  AddTaskVC.swift
//  ToDoList
//
//  Created by Youssef on 26/10/2021.
//

import UIKit

class AddTaskVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var taskNameTF: UITextField!
    @IBOutlet weak var taskDetailsTextView: UITextView!
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    @IBOutlet weak var prioritiesPickerView: UIPickerView!
  
    
    //MARK: - CONSTANTS AND VARIABLES
    let prioritiesArray = ["High","Middle","Low"]
    var selectedPriority = ""
    var addTaskProtocolReference:AddTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarContent()
        setScreenDefaultForm()
    }

    //MARK: - Helper Methods
    func setNavigationBarContent() {
        self.navigationItem.title = "Add Task"
        let submit = UIBarButtonItem(title: "submit", style: .plain, target: self, action:#selector(self.submitBtnAction)
        )
        self.navigationItem.setRightBarButton(submit, animated: true)
    }
    @objc func submitBtnAction() {
        if taskNameTF_IsEmpty() {
            let alert = UIAlertController(title: "Missed Data !", message: "The task name is not existed", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else if taskDetailsTextView_IsEmpty(){
            let alert = UIAlertController(title: "Missed Data !", message: "The task details is not existed", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else if deadlineIsBeforStartDate(){
            let alert = UIAlertController(title: "Not Valid deadline !", message: "The deadline MUST be after current date", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default){ (_) in
                self.deadlineDatePicker_defaultForm()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "ensure adding", message: "Do you want to submit adding new task ?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
                self.submitAdding()
            }
            let noAction = UIAlertAction(title: "No", style: .default) { (_) in
                self.setScreenDefaultForm()
            }
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
    }
    func submitAdding() {
        let newTask = Task(name: getTextOfTaskNameTF(), details: getTextOftaskDetailsTextView(), priority: getSelectedPriority(), startDate: getCurrentDateAsString(), deadline: getTextOfDeadlineDatePicker())
        addTaskProtocolReference.pathNewTask(add: newTask)
        setScreenDefaultForm()
    }
    func setScreenDefaultForm() {
        TaskNameTF_defaultForm()
        taskDetailsTextView_defaultForm()
        deadlineDatePicker_defaultForm()
        prioritiesPickerView_defaultForm()
    }
}

