//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import Foundation
import Combine

class TaskListViewModel : ObservableObject {
    
    @Published var tasks   = [TaskViewModel]()
    
    init() {
        fetchAllTasks()
    }
    
    func fetchAllTasks() {
        self.tasks = CoreDataManager.shared.getAllTasks().map(TaskViewModel.init)
    }
    
    func deleteTodo(viewModel:TaskViewModel) {
        CoreDataManager.shared.deleteTask(taskName: viewModel.taskName )
        //fetchAllTasks()
    }
    
    func todayTask() -> [TaskViewModel] {
        return tasks.filter{Calendar.current.isDateInToday($0.createDate)}
    }
    
    
    func tomorrowTask() -> [TaskViewModel] {
        return tasks.filter{Calendar.current.isDateInTomorrow($0.createDate)}
    }
    
    
    func upcomingTask() -> [TaskViewModel] {
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        return tasks.filter{$0.createDate > Calendar.current.date(from: DateComponents(year: now.year, month: now.month, day: now.day! + 2))!}
    }
    
}
