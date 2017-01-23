//
//  ViewController.swift
//  GetAndSet
//
//  Created by WJ on 17/1/11.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        person = Person()
        person.name = "bck"
        
        print(person.title ?? "")
        
        print(person.title2 ?? "")
        // person.title 是只读属性,不能被修改
//        person.title = "vacj"
        
        print(person.title3 ?? "")
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        person.name = "YYYYYYY"
        
        // title2 的值被改变
        print(person.title2 ?? "")
        
        // title3 的值没有被改变
        print(person.title3 ?? "")
    }




}

