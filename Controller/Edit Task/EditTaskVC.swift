//
//  EditTaskVC.swift
//  ToDoList
//
//  Created by Youssef on 29/10/2021.
//

import UIKit

class EditTaskVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var taskNameTF: UITextField!
    @IBOutlet weak var taskDetailsTextView: UITextView!
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    @IBOutlet weak var prioritiesPickerView: UIPickerView!
    
    //MARK: - CONSTANTS AND VARIABLES
    var task:Task?
    let prioritiesArray = ["High","Middle","Low"]
    var selectedPriority = ""
    var editTaskProtocolReference:MoveEditsToTaskInfoVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarContent()
        setScreenDefaultForm()
    }
    //MARK: - Helper Methods
    func setNavigationBarContent() {
        self.navigationItem.title = "Edit Task"
        let submit = UIBarButtonItem(title: "submit", style: .plain, target: self, action:#selector(self.submitBtnAction)
        )
        self.navigationItem.setRightBarButton(submit, animated: true)
    }
    @objc func submitBtnAction() {
        if taskNameTF_IsEmpty() {
            let alert = UIAlertController(title: "Missed Data !", message: "The task name is not existed", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (_) in
                self.taskNameTF.text = self.task?.name
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else if taskDetailsTextView_IsEmpty(){
            let alert = UIAlertController(title: "Missed Data !", message: "The task details is not existed", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (_) in
                self.taskDetailsTextView.text = self.task?.details
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else if deadlineIsBeforeStartDate(){
            let alert = UIAlertController(title: "Not Valid deadline !", message: "The deadline MUST be after the start date of the task", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default){ (_) in
                self.deadlineDatePicker_defaultForm()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "ensure Editting", message: "Do you want to submit Editting the task ?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
                self.submitEditting()
            }
            let noAction = UIAlertAction(title: "No", style: .default) { (_) in
                self.setScreenDefaultForm()
            }
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
    }
    func submitEditting() {
        task?.name = getTextOfTaskNameTF()
        task?.details = getTextOftaskDetailsTextView()
        task?.deadline = getTextOfDeadlineDatePicker()
        task?.priority = getSelectedPriority()
        editTaskProtocolReference?.pathTask(edits: task!)
        self.navigationController?.popViewController(animated: true)
    }
     func setScreenDefaultForm() {
         TaskNameTF_defaultForm()
         taskDetailsTextView_defaultForm()
         deadlineDatePicker_defaultForm()
         prioritiesPickerView_defaultForm()
     }
    
}
