//
//  AppDelegate.swift
//  douyuLive
//
//  Created by FDC on 2019/5/10.
//  Copyright © 2019 FDC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }


}

