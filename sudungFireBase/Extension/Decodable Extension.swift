//
//  Snapshot Extension.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/15/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension DocumentSnapshot {
    func decode<T: Decodable>(as objecType: T.Type, includingId: Bool = true) throws -> T {
        
        var documentJson = data()
        if includingId {
            documentJson!["id"] = documentID
            
        }
        let documentData = try JSONSerialization.data(withJSONObject: documentJson, options: [])
        let decodeObject = try JSONDecoder().decode(objecType, from: documentData)
        return decodeObject
    }
}
