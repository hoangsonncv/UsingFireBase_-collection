//
//  AlertService.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/15/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import Foundation
import UIKit

class AlertService {
    private init (){}
    
    static func addUser(in vc: UIViewController, completion: @escaping (User) -> Void){
        let alert = UIAlertController(title: "Add User", message: nil, preferredStyle: .alert)
        // textfiled
        alert.addTextField { (nameTF) in
            nameTF.placeholder = "Name"
        }
        alert.addTextField { (ageTF) in
            ageTF.placeholder = "Age"
            ageTF.keyboardType = .numberPad
        }
        let add =  UIAlertAction(title: "Add", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text else  {return}
            guard  let ageString = alert.textFields?.last?.text else {return}
            guard let age = Int(ageString) else {return}
            let user = User(name: name, age: age)
            completion(user)
            
        }
        
        // add Action
        alert.addAction(add)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func updateUser(_ user: User, in vc: UIViewController, completion: @escaping (User) -> Void){
        
        let alert = UIAlertController(title: "Update user \(user.name)", message: nil, preferredStyle: .alert)
        alert.addTextField { (ageTF) in
            ageTF.placeholder = "Age"
            ageTF.keyboardType = .numberPad
            ageTF.text = String(user.age)
        }
        
        let update = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let ageString = alert.textFields?.last?.text else {return}
            guard let age = Int(ageString) else {return}
            let updateUser = user
            updateUser.age = age
            completion(updateUser)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        // addAction
        alert.addAction(update)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
    }
}
