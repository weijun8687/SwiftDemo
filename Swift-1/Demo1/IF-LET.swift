//
//  IF-LET.swift
//  Demo1
//
//  Created by WJ on 16/12/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class IF_LET: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
//        demo()
        demo2()
        
    }
    
    
    // MARK: - guard let 守护一直有值,如果没有值,直接返回
    func demo2() {
        let oName: String? = "laowang"
        let oAge: Int? = 20
        
        guard let name = oName,
            let age = oAge else {
                
                print("name 或 age 为 nil")
                return
        }
        // 代码执行到此,name ,age 一定有值
        // 使用if let 会多了一层判断,  guard 是降低分支层次的办法
        print(name + String(age))

    }
    
    
    // MARK:- if let / var 连用语法就是为了判断值
    // 不是单纯的if
    func demo() {
        let oName: String? = nil //"laowang"
        let oAge: Int? = 20
        
        
        // if let 连用,判断对象的值是否为 nil,{}内一定有值,可以直接使用,不需要解包
        // if var 连用,{} 中可以对值进行修改
        if var name = oName,
            let age = oAge{
            
            // 进入分支后,name 和 age 一定有值,不需要解包
            name = "laoe"
            
            print(name + String(age))
        }else{
            print("name 或 age 为 nil")
        }
        
        
        
        
    }

    
}
