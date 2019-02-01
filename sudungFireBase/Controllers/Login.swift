//
//  ViewController.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/11/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import UIKit
import FirebaseDatabase
class Login: UIViewController {
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkLogin(_ sender: UIButton) {
        pushSB()
//        performSegue(withIdentifier: "LisrMeals", sender: nil)
    }
    // MARK: Navigation
    
    func pushSB() {
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let listMeal = mainSB.instantiateViewController(withIdentifier: "ListMeals")
        let navigation = UINavigationController(rootViewController: listMeal)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    

}

