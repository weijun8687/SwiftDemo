//
//  Person.swift
//  Demo1
//
//  Created by WJ on 16/12/24.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class Person: NSObject {

    //1. 定义模型属性的时候,如果是对象,通常都是可选的
    //  - 在需要的时候创建
    //  - 避免写构造函数,简化代码
    //2. 如果是基本数据类型(int, float, double 等),不能设置成可选的,并且要设置初始值,否则KVC会崩溃
    //3. 如果使用KVC, 属性不能是 private类型
    //4. 使用KVC方法之前, 应该先调用 super.init 保证对象实例化完成

    
    var name: String?
    
    //2. 如果是基本数据类型(int, float, double 等),不能设置成可选的,并且要设置初始值,否则KVC会崩溃
    var age: Int = 0
    
    //3. 如果使用KVC, 属性不能是 private类型
    private var title: String?
    
    
    override init() {
        
        name = "zhang"
        
        super.init()
    }
    
    // 重载构造函数
    init(dict: [String : AnyObject]) {
        
        super.init()
        
        // 使用KVC方法之前, 应该先调用 super.init 保证对象实例化完成
        setValuesForKeys(dict)
        
    }
    
    
    // 当传过来的字典的属性 多余模型的属性时
    // 重写父类的方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        // 没有调用 super 的方法, 将父类的方法完全覆盖, 不会崩溃
    }
    
    // 使用运行时获取当前类的所有属性的数组
    class func propertyList() -> [String] {
     
        var count: UInt32 = 0
        
        //1. 获取类的属性列表, 返回属性列表的数组, 可选项
        let list = class_copyPropertyList(self, &count)
        
        print("数量  \(count)")
        
        //2. 遍历数组
        for i in 0..<Int(count) {
            // 3. 根据下标获取属性
            // objc_property_t?
            let pty = list?[i]
            
            // 4. 获取'属性'的名称,C 语言字符串
            // Int8 -> Byte -> Char -> C语言的字符串
            let cName = property_getName(pty)
            
            let name = NSString(utf8String: cName!)
            
            print(name ?? "")
            
        }
        
        // 5. 释放C 语言对象
        free(list)
        
        
        
        // 返回的是空数组
        return []
    }
}
