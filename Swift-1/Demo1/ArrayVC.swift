//
//  ArrayVC.swift
//  Demo1
//
//  Created by WJ on 16/12/13.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class ArrayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        demo3()
    }
    
    // MARK: - 数组的合并
    func demo3() {
        var arr = ["a", "b", "c"];
        let arr1 = ["d", "k", "l"];
        arr += arr1
        print(arr)
        
        // 要合并的数组类型一定要一样
        var arr2: [Any] = ["a", "b", "c"];
        let arr3 = ["d", "k", "l", 16] as [Any]
        arr2 += arr3
        print(arr2)
    }
    
    func demo1() {
        // 默认推导出的是string类型的
        let arr1 = ["张山", "李四", "王五"]
        print(arr1)
        
        // int
        let arr2 = [1, 2, 3, 4]
        print(arr2)
        
        // CGPoint
        let point = CGPoint(x: 10, y: 30)
        let arr3 = [point]
        print(arr3)
        
        // 混合数组
        // 混合数组中 CG 结构体需要包装  (使用 NSValue 包装)
        let value = NSValue(cgPoint: point)
        print(value)
        
        // any 类型
        let arr4 = ["zhangshan", 1, value] as [Any]
        print(arr4)
    }

    // MARK: -  数组的遍历
    func demo2() {
        let arr1 = ["张山", "李四", "王五"]
        
        // 1.按照下标遍历
        for i in 0..<arr1.count {
            print(arr1[i])
        }
        
        // 2. for in 遍历元素
        for s in arr1 {
            print(s)
        }
        
        // 3. enum 同时遍历下标和内容
        // e 是元组
        for e in arr1.enumerated() {
//            print(e)
            print("\(e.offset) \(e.element)")
        }
        
        // 4.遍历下标和内容2
        for (n, s) in arr1.enumerated() {
            print("\(n) \(s)")
        }
        
        // 5.反序遍历
        for s in arr1.reversed() {
            print(s)
        }
        
        // 6.反序索引&内容
        // 正确
        for s in arr1.enumerated().reversed() {
            print(s)
        }
        
//        // 错误
//        for s in arr1.reversed().enumerated() {
//            print(s)
//        }
        
    }
    
    
}
