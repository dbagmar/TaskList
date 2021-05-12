//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import Foundation

import CoreData

class CoreDataManager {
    
    var moc : NSManagedObjectContext
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    private init(moc:NSManagedObjectContext){
        self.moc = moc
    }
    
    func fetchTodo(taskName:String) -> TaskList? {
        var taskList    = [TaskList]()
        
        let request: NSFetchRequest<TaskList>    = TaskList.fetchRequest()
        request.predicate    = NSPredicate(format: "taskName == %@", taskName)
        
        do {
            taskList = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return taskList.first
    }
    
    func deleteTask(taskName:String){
        do {
            if let todo = fetchTodo(taskName: taskName){
                self.moc.delete(todo)
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }

    func updateTask(task:TaskViewModel) -> Bool {
        do {
            if let fetchTask = fetchTodo(taskName: task.taskName){
                fetchTask.taskDetail = task.taskDetail
                fetchTask.createDate = task.createDate
                fetchTask.id = " "
                try self.moc.save()
                return true
            }else{
                return false
            }
        } catch let error as NSError {
            print(error)
            return false
        }
    }

    
    
    func getAllTasks() -> [TaskList] {
        var tasks   = [TaskList]()
        let tasksRequest : NSFetchRequest<TaskList>  = TaskList.fetchRequest()
        
        do {
            tasks = try self.moc.fetch(tasksRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return tasks
    }
    
    func saveTask(newTask:Task) -> Bool {
        let task    = TaskList(context: self.moc)
        task.taskName = newTask.taskName
        task.taskDetail = newTask.taskDetail
        task.id = newTask.id
        task.createDate = newTask.createDate
        do {
            try self.moc.save()
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }
}
