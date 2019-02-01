//
//  User.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/15/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import Foundation

protocol Identifiable {
    var id: String? {get set}
}

class User: Codable, Identifiable {
    var id: String? = nil
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
