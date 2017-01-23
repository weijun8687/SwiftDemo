//
//  ViewController.swift
//  TryCatch错误处理
//
//  Created by WJ on 17/1/23.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 字典字符串
//        let jsonString = "{\"name\": \"zhang\"]"
        let jsonString = "{\"name\": \"zhang\"}"

        
        // string -> data
        let data = jsonString.data(using: .utf8)
        
        // 反序列化 throw 抛出异常
        // 方法1: 推荐 try? , 解析成功就有值, 否则为 nil
        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
        print(json ?? "hahaha")
        
        // 同方法1
        guard let json1 = try? JSONSerialization.jsonObject(with: data!, options: []) else {
            return
        }
        print(json1)
        
        // 方法2 不推荐!  解析成功,有值  否则,崩溃.  有风险
//        let json2 = try! JSONSerialization.jsonObject(with: data! as Data, options: [])
//        print(json2)
        
        // 方法3 处理异常, 能够接收错误,并且输出错误
        // OC 中使用的是ARC机制, 自动添加 retain, release, autorelease, 如果使用 try catch 一旦不平衡, 会出现内存泄漏
        
//        do {
//            let json3 = try JSONSerialization.jsonObject(with: data! as Data, options: [])
//            print(json3)
//        } catch {
//            print(error)
//        }
        
        
    }


}

