//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import Foundation


struct TaskViewModel{
    var taskName = " "
    var taskDetail = " "
    var createDate = Date()
    var id = " "
    
    init (task:TaskList){
        self.taskName = task.taskName ?? " "
        self.taskDetail = task.taskDetail ?? " "
        self.createDate = task.createDate ?? Date()
        self.id = task.id ?? " "
    }
    
}
