//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    let addViewModel = AddTaskViewModel()
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDetailTextField: UITextField!
    @IBOutlet weak var taskDateDatePicker: UIDatePicker!
    @IBOutlet weak var addTaskLabel: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    var task:TaskViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDateDatePicker.minimumDate = Date()
        taskDetailTextField.delegate = self
        taskNameTextField.delegate = self
        if task != nil {
            addTaskLabel.text = "Update Task"
            submitBtn.setTitle("Upadate", for: .normal)
            taskNameTextField.text = task?.taskName
            taskDetailTextField.text = task?.taskDetail
        }else{
            addTaskLabel.text = "Add Task"
            submitBtn.setTitle("Save", for: .normal)
        }
        
    }
    


    @IBAction func onClickSubmitBtn(_ sender: Any) {
        
        if task != nil {
            task?.taskDetail = taskDetailTextField.text ?? " "
            task?.id = " "
            task?.createDate = taskDateDatePicker.date
            if addViewModel.updateTask(task: task!) {
                self.navigationController?.popViewController(animated: true)
            }else{
                showAlert(withTitle: "Error", withMessage: "Task not save")
            }
        }else{
            if taskNameTextField.text?.isEmpty ?? true {
                showAlert(withTitle: "Error", withMessage: "Please enter task name")
            }else{
                let task = Task.init(taskName: taskNameTextField.text, taskDetail: taskDetailTextField.text, id: " ", createDate: taskDateDatePicker.date)
                if addViewModel.saveTask(task: task){
                    self.navigationController?.popViewController(animated: true)
                }else{
                    showAlert(withTitle: "Error", withMessage: "Task not save")
                }
            }
        }
    }
    
    
    
    @IBAction func onClickCancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension AddTaskViewController{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if task != nil && textField == taskNameTextField{
            return false
        }else{
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
