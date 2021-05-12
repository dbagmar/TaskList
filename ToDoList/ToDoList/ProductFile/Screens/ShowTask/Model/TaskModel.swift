//
//  TaskModel.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import Foundation

struct Task:Hashable {
    var taskName:String?
    var taskDetail:String?
    var id:String?
    var createDate:Date?
}
