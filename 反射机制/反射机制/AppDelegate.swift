//
//  AppDelegate.swift
//  反射机制
//
//  Created by WJ on 17/1/11.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        // 正常的创建控制器
//        window?.rootViewController = ViewController()
        
        print(Bundle.main.infoDictionary ?? "")
        
/* 1. 原始的
        // 使用反射机制
        // 设置跟控制器,需要添加 命名空间 -> 默认就是"项目名称" 注意:最好不要有数字和特殊符号
//        let clsName = "反射机制.ViewController"
        
        // 动态获取 空间命名
        let spaceName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        
*/
        
/*2. 使用方法
        let spaceName = Bundle.main.namespace()
 
*/
        // 3. 使用计算性变量
        let spaceName = Bundle.main.namespace
        
        let clsName = spaceName + "." + "ViewController"

        // AnyClass? -> 视图控制器的类型
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        // 使用类创建视图控制器
        let vc = cls?.init()
        window?.rootViewController = vc
        
        window?.makeKeyAndVisible()
        
        return true
    }



}

