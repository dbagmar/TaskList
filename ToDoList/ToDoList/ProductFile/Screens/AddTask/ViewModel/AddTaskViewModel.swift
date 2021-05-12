//
//  File.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import Foundation

class AddTaskViewModel{
    func saveTask(task:Task) -> Bool {
       return CoreDataManager.shared.saveTask(newTask: task)
    }
    
    func updateTask(task:TaskViewModel) -> Bool {
       return CoreDataManager.shared.updateTask(task: task)
    }
}
