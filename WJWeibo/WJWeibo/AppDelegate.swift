//
//  AppDelegate.swift
//  WJWeibo
//
//  Created by WJ on 17/1/13.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = UIColor.white
        window?.rootViewController = WJTabBarController()
        
        window?.makeKeyAndVisible()
        
        loadAppInfo()
        
        return true
    }

}

// MARK:- 从服务器加载应用程序信息
extension AppDelegate{
    
    fileprivate func loadAppInfo() {
        
        // 模拟异步加载数据
        DispatchQueue.global().async {
            // 1. url
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)

            // 2. data
            let data = NSData(contentsOf: url!)
            
            // 3.写入磁盘
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
            data?.write(toFile: jsonPath, atomically: true)
            
            print(jsonPath)
            
        }
        
        
        
    }
    
}

