//
//  ViewController.swift
//  Swift设置模型属性
//
//  Created by WJ on 17/1/11.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let p = Person()
        p.name = "老王"
        
        let lable = DemoLabel(frame: CGRect(x: 40, y: 40, width: 100, height: 40))
        view.addSubview(lable)
        lable.p = p

    }
}

