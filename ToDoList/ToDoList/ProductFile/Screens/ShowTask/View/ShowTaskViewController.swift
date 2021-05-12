//
//  ShowTaskViewController.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import UIKit

class ShowTaskViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    @IBOutlet weak var showTaskTableView: UITableView!
    var arrofTask:[TaskViewModel] = []
    var taskViewModel = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // taskViewModel.fetchAllTasks()
        self.showTaskTableView.delegate = self
        self.showTaskTableView.dataSource = self
        self.showTaskTableView.register(UINib(nibName: "ShowTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowTaskTableViewCell")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskViewModel.fetchAllTasks()
        arrofTask = taskViewModel.todayTask()
        showTaskTableView.reloadData()
    }
    
    @IBAction func onClickTodayTaskBtn(_ sender: Any) {
        arrofTask = taskViewModel.todayTask()
        if arrofTask.isEmpty {
           showAlert(withTitle:"No Task" , withMessage: "Please check another task section")
        }
            showTaskTableView.reloadData()
        
    }
    
    
    @IBAction func onClickTomorrowTaskBtn(_ sender: Any) {
        arrofTask = taskViewModel.tomorrowTask()
        if arrofTask.isEmpty {
           showAlert(withTitle:"No Task" , withMessage: "Please check another task section")
        }
        showTaskTableView.reloadData()
    }
    
    @IBAction func onClickUpcomingTaskBtn(_ sender: Any) {
        arrofTask = taskViewModel.upcomingTask()
        if arrofTask.isEmpty {
           showAlert(withTitle:"No Task" , withMessage: "Please check another task section")
        }
        showTaskTableView.reloadData()
    }
    
}


extension ShowTaskViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrofTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ShowTaskTableViewCell") as! ShowTaskTableViewCell
        cell = cell.showData(task: self.arrofTask[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            taskViewModel.deleteTodo(viewModel: arrofTask[indexPath.row])
            viewWillAppear(true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController
        vc?.task = arrofTask[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
