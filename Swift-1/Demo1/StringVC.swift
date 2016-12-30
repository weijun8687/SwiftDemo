//
//  StringVC.swift
//  Demo1
//
//  Created by WJ on 16/12/12.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class StringVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        demo4()
    
    }

    // MARK: -  统计字符串个数
    func demo() {
        
        let str = "hello world你好"
        
        // 1. 返回指定编码的对应的字节数量
        // utf8 编码(0~4个),每个汉字为 3 个字节
        print(str.lengthOfBytes(using: .utf8))
        
        // 2. 字符串的长度,返回字符的个数
        print(str.characters.count)
        
        // 3. 使用 NSString 中转
        // OC 类型转换: (类型 *)值
        // Swift 类型转换: 值 as 类型
        
        let ocStr = str as NSString
        print(ocStr.length)
    }
    
    // MARK: - 拼接字符串
    func demo2() {
        let name = "laowang"
        let age = 10
        let title: String? = "Boss"
        let point = CGPoint(x: 10, y: 10)
        
        print("\(name) \(age) \(title ?? "") \(point)")
    }
    
    // MARK: - 字符串格式
    func demo3() {
        let h = 8
        let m = 27
        let s = 6
        
        print("\(h):\(m):\(s)")
        
        print(String(format: "%02d:%02d:%02d", h, m, s))
    }
    
    func demo4() {
        let str = "让我们一起去飞"
        
        // 1. 先将字符串转换成 OC字符串,然后进行截取
        let ocStr = str as NSString
        let strSub1 = ocStr.substring(with: NSRange(location: 2, length: 3))
        print(strSub1)
        
        // 2. 
//        let r = 0..<3
//        let strSub2 = str.substring(with: <#T##Range<String.Index>#>)
        
        print(str.startIndex)
        print(str.endIndex)
        
        let s1 = str.substring(to: "abc".endIndex)
        print(s1)
        let s2 = str.substring(from: "让我们".endIndex)
        print(s2)
        
        
        guard let range = str.range(of: "一起") else {
            print("没有找到字符串")
            return
        }
        
        // 一定能找到字符串的范围
        print(range)
        print(str.substring(with: range))
        

        
    }
    
}
