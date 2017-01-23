//
//  Person.swift
//  GetAndSet
//
//  Created by WJ on 17/1/11.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class Person: NSObject {

    // 事先定义一个变量,
    private var _name: String?
    // Swift 中一般不用重写getter && setter 方法
    var name: String? {
        get{
            return _name
        }
        
        set{
            _name = newValue
        }
    }
    var age: Int = 0
    
    
    // 相当于重写 geter 方法, 在外部不能被修改(只读)
    var title: String? {
        return "AAA" + name!
    }
    
    // 等于上面的代码
    var title2: String? {
        get{
            return "BBB" + name!
        }
    }
    
    // 懒加载的 title 本质是一个闭包
    // 懒加载会在第一次访问的时候执行, 闭包执行结束后, 会把结果保存在 title3 中
    // 后续调用不在执行闭包,直接返回 title3 中的内容
    // 懒加载属性会分配空间存储值
    lazy var title3: String? = {
        return "lazy" + (self.name ?? "")
    }()
    
    // Initializer does not override a designated initializer from its superclass
    convenience init?(name: String, age: Int) {
        
        guard age > 100 else {
            return nil
        }
        
        self.init()
        self.name = name
        self.age = age
        
    }
    
    
    
    
}
