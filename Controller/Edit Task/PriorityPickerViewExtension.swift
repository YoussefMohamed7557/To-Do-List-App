//
//  PriorityPickerViewExtension.swift
//  ToDoList
//
//  Created by Youssef on 29/10/2021.
//
// operations that Related to task priority
import UIKit
extension EditTaskVC:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func getSelectedPriority() -> String{
        return selectedPriority
    }
    func prioritiesPickerView_defaultForm() {
        selectedPriority = task!.priority
        if selectedPriority == "High" {
            prioritiesPickerView.selectRow(0, inComponent: 0, animated: true)
        } else if selectedPriority == "Middle"{
            prioritiesPickerView.selectRow(1, inComponent: 0, animated: true)
        } else{
            prioritiesPickerView.selectRow(2, inComponent: 0, animated: true)
        }
        prioritiesPickerView.tintColor = #colorLiteral(red: 0.1908083257, green: 0.1908083257, blue: 0.1908083257, alpha: 1)
    }
    
    // delegate and data source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return prioritiesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return prioritiesArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPriority = prioritiesArray[row]
    }
    
}

