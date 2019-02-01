//
//  ListMealTblV.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/14/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import UIKit

class PersonsTbl: UITableViewController {
    
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let xavi = User(name: "Xavi", age: 19)
        FirestoreService.shared.read(from: .users, returing: User.self) { [unowned self] users in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = String(users[indexPath.row].age)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let user = users[indexPath.row]
            FirestoreService.shared.delete(for: user, in: .users)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        AlertService.updateUser(user, in: self) { [unowned self](updateUser) in
            FirestoreService.shared.update(for: updateUser, in: .users)
        }
    }
    
    // MARK: Action Ontap
    @IBAction func addMeals(_ sender: UIBarButtonItem) {
        AlertService.addUser(in: self) { [unowned self] user in
            FirestoreService.shared.create(for: user, in: .users)
        }
    }
    
    
}
