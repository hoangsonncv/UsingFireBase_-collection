//
//  FirestoreService.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/15/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class FirestoreService {
    private init(){}
    //declare
    static let shared = FirestoreService()
    var users:[User] = []
    
    func configure() {
        FirebaseApp.configure()
    }
    // Ket noi firebase thong qua key
    private func reference(to collectionReference: FirestoreReference) -> CollectionReference{
        return Firestore.firestore().collection(collectionReference.rawValue)
       
    }
    // Create new in firebase
    func create<T: Encodable>(for encodableObject: T, in collectionReference: FirestoreReference){
    
        do {
            let json = try encodableObject.toJson()
            reference(to: collectionReference).addDocument(data: json)
            
        } catch  {
            print(error)
        }
    }
    // Read data in firebase
    func read<T: Codable>(from colleciontReference: FirestoreReference, returing objectType: T.Type ,completion: @escaping ([T]) -> Void)  {
        
        reference(to: colleciontReference).addSnapshotListener { (snapshot, _) in
            guard let snapshot = snapshot else {return}
            
            do {
                var objects: [T] = []
                for item in snapshot.documents {
                    let object = try item.decode(as: objectType)
                    objects.append(object)
                }
                completion(objects)
            } catch  {
                print(error)
            }
            
        }
    }
    // update
    func update<T: Encodable & Identifiable>(for encodableObject: T, in collectionReference: FirestoreReference)  {
        do {
            let json = try encodableObject.toJson(excluding: ["id"])
            guard let id = encodableObject.id else { throw MyError.encodingError}
            reference(to: collectionReference).document(id).setData(json)
        } catch  {
            print(error)
        }
    }
    
    func delete<T:  Identifiable>(for encodableObject: T, in collectionReference: FirestoreReference)  {

        do {
            guard let id = encodableObject.id else {throw MyError.encodingError}
            reference(to: collectionReference).document(id).delete()
        } catch  {
            print(error)
        }
    }
}
