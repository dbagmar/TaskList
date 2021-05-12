//
//  ShowTaskTableViewCell.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import UIKit

class ShowTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskId: UILabel!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDetail: UILabel!
    @IBOutlet weak var taskDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showData(task:TaskViewModel) -> ShowTaskTableViewCell {
        self.taskId.text = "Task Id:- " + task.id
        self.taskName.text = "Task Name:- " + task.taskName
        if task.taskDetail.isEmpty {
            self.taskDetail.isHidden = true
        }else{
            self.taskDetail.isHidden = false
            self.taskDetail.text = "Task Detail:- " + task.taskDetail
        }
       
        
        // Date Formating
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        self.taskDate.text = "Date:- " + df.string(from: task.createDate)
        return self
    }
    
}
