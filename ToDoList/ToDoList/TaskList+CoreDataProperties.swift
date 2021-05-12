//
//  TaskList+CoreDataProperties.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//
//

import Foundation
import CoreData


extension TaskList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskList> {
        return NSFetchRequest<TaskList>(entityName: "TaskList")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var taskDetail: String?
    @NSManaged public var id: String?
    @NSManaged public var createDate: Date?

}

extension TaskList : Identifiable {

}
