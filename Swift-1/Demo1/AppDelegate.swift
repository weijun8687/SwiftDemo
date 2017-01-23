//
//  AppDelegate.swift
//  Demo1
//
//  Created by WJ on 16/7/17.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

import Foundation
import CocoaLumberjack


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
     
        defaultDebugLevel = DDLogLevel.info
        
                self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
                self.window?.rootViewController = LoadBaidu()
        //        self.window?.rootViewController = AlertViewController()
        //        self.window?.rootViewController = viewController2();
        
        //        self.window?.makeKeyAndVisible()
        
        DDLogInfo("sdfgfhgjhkjlk")
        
        
        return true

    }
    
    
    
    private func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    private func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    private func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    private func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    private func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

