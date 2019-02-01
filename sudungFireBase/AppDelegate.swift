//
//  AppDelegate.swift
//  sudungFireBase
//
//  Created by ADMIN on 1/11/19.
//  Copyright © 2019 NguyenHoangSon. All rights reserved.
//

import UIKit
import FirebaseFirestore
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirestoreService.shared.configure()
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings

        return true
    }

}

