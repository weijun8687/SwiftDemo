//
//  OptionalVC.swift
//  Demo1
//
//  Created by WJ on 16/12/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class OptionalVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        demo1()
    
    }
    
    
    func demo1() {
        // 定义y, 没有初始化
        let y: Int?
        // let 类型的是常量, 只能初始化一次
        y = 90
        // 再次修改常量时会报错
//        y = 20
        print(y ?? 0)
        
        
        // var 类型的可选值 默认初始值为nil
        // let 类型的可选值没有默认值
        var x: Int?
        
        x = 10
        x = 45
        
        print(x ?? 0)
        
        
        
        
        
    }

    func demo() {
        // 1.原始的可选项定义
        // none: 没有值   some:某一类型的值
        let x: Optional = 10
        
        print(x ?? "0")
        
        // "?" 定义该变量为可选项
        let y: Int? = 20
        
        print(y ?? 0)
        
        // 不同类型之间的值不能直接运算  nil不是任何数据类型,不能参与运算
        // "!" 强行解包 : 从可选值中清醒获取对应的非空值,  如果真的为 nil,则程序会崩溃
        // 程序员必须为每一个"!"负责
        // 程序中尽量少用"!"
        
        // ?? 如果变量值为空的时候就会把后面的值赋给变量
        // ?? 的优先级低,使用的时候应与括号一块使用
        // x ?? 0  ->  (x != nil) ? x : 0
        print((x ?? 0) + (y ?? 3))
        
        
        
        
        
    }


}
