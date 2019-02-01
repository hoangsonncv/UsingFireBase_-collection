//
//  Encodable.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/15/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import Foundation

enum MyError: Error {
    case encodingError
}

extension Encodable {
    func toJson(excluding keys: [String] = []) throws -> [String: Any] {
        
        let objectData = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: objectData, options: [])
        guard var json = jsonObject as? [String: Any] else {throw MyError.encodingError}
        
        for key in keys {
            json[key] = nil
        }
        return json
    }
}
