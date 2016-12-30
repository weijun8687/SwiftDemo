//
//  Block-闭包.swift
//  Demo1
//
//  Created by WJ on 16/11/12.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class Block___: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        //1. 没有参数,没有返回值,最简单的闭包
        let b1 = {
            print("最简单的闭包")
        }
        // 执行闭包
        b1()
        
        //2. 带参数,没有返回值的闭包
        let b2 = {  (x : Int) ->Void in
            print(x);
        }
        b2(100)
        
        // 3. 带参数  带返回值的闭包
        // 注: 闭包中 参数,返回值,代码实现 都写在 {} 中
        // 需要使用关键字 "in" 来分隔定义与
        let b3 = {  (x : Int , y : Int) -> Int in
            return x + y
        }
        print(b3(10, 20))


    }


}
