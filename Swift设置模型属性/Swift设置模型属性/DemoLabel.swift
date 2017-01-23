//
//  DemoLabel.swift
//  Swift设置模型属性
//
//  Created by WJ on 17/1/11.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    // 模型 -> 给视图设置模型
    var p: Person?{
        
        // didSet 替代OC中重写 setter 方法
        // 区别: 再也不需要考虑 _成员变量 = 值!
        // OC 中如果是 copy 属性,应该是 _成员变量 = 值.copy
        didSet{
            // 此时 name 属性应景有值,可以直接使用设置 ui 内容
            text = p?.name
        }
    }
}
