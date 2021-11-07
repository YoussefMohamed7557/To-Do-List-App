//
//  DoneSearchExtension.swift
//  ToDoList
//
//  Created by Youssef on 04/11/2021.
//

import UIKit
extension DoneVC:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        restore(TasksArr: &tasksArr)
        doneTable.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            restore(TasksArr: &tasksArr)
            doneTable.reloadData()
        }else{
            tasksArr = tasksArr.filter({ (task) -> Bool in
                task.name.contains(searchText.lowercased()) || task.name.contains(searchText.uppercased())
            })
            doneTable.reloadData()
        }
    }
}
