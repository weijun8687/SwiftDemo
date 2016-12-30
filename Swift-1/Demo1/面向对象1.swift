//
//  面向对象1.swift
//  Demo1
//
//  Created by WJ on 16/12/24.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class ____1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        initSubViews()
        
    }


    func initSubViews() {
        
        let tf1 = UITextField(frame: CGRect(x: 20, y: 40, width: 40, height: 20))
        tf1.borderStyle = .roundedRect
        view.addSubview(tf1)
        
        
        // control + command + e  选择该页所有光标所在的单词的
        let tf3 = UITextField(frame: CGRect(x: 20, y: 40, width: 40, height: 20))
        tf3.borderStyle = .roundedRect
        view.addSubview(tf3)
        
        
        let btn = UIButton(type: UIButtonType.custom)
        view.addSubview(btn)
        btn.frame = CGRect(x: 100, y: 80, width: 60, height: 30)
        btn.backgroundColor = UIColor.blue
        btn.setTitle("提交", for: UIControlState.normal)
        
        // button 添加点击事件  action:#selector(文件名.方法名)
        btn.addTarget(self, action:#selector(____1.clickButton) , for: UIControlEvents.touchUpInside)

        
    }
    
    func clickButton() -> () {
        // 打印方法名
        print(#function)
    }
    
}
