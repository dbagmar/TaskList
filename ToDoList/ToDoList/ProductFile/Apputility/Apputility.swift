//
//  Apputility.swift
//  ToDoList
//
//  Created by Darshan Bagmar on 12/05/21.
//

import Foundation
import UIKit


    
extension  UIViewController {

        func showAlert(withTitle title: String, withMessage message:String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
            })
            alert.addAction(ok)
            alert.addAction(cancel)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        }
}
    

