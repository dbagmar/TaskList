//
//  NsManagedObjectContext+Extension.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 11/05/21.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current : NSManagedObjectContext {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
