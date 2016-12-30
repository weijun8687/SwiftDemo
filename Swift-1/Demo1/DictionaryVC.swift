//
//  DictionaryVC.swift
//  Demo1
//
//  Created by WJ on 16/12/14.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class DictionaryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        demo4()
    }

    func demo4() {
        var dict = ["name": "王", "age": 10, "title": "BOSS"] as [String : Any]

        let dict2 = ["name": "小李", "height": 173] as [String : Any]
        
        for e in dict2 {
            dict[e.key] = dict2[e.key]
        }
        print(dict)
        
    }
    
    // MARK: - 遍历
    func demo3() {
        let dict = ["name": "王", "age": 10, "title": "BOSS"] as [String : Any]

        for e in dict {
            print(e)
        }
        
        for (k, v) in dict {
            print("\(k) \(v)")
        }
    }
    
    
    // MARK: - 增删改
    func demo2() {
        var dict = ["name": "王", "age": 10] as [String : Any]
        // 如果 KEY 不存在,就是新增
        dict["title"] = "BOSS"
        print(dict)
        
        // 如果 KEY 存在,就修改值
        dict["name"] = "小李"
        print(dict)
        
        // 删除
        dict.removeValue(forKey: "age")
        print(dict)
        
        // 删除所有的键值需要保留原来的内存
        dict.removeAll(keepingCapacity: true)
    }

    // MARK: - 字典的定义
    func demo1() {
//        let dict: [String: Any] = ["name": "王", "age": 10]
        let dict = ["name": "王", "age": 10] as [String : Any]
        print(dict)
        
        // 数组中存放字典
//        let arr: [[String: Any]] = [
//            ["name": "李","age": 18],
//            ["name": "王","age": 30]
//        ]
        let arr = [
            ["name": "李","age": 18],
            ["name": "王","age": 30]
        ]
        
        print(arr)
        
    }

}
