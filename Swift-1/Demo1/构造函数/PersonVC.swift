//
//  PersonVC.swift
//  Demo1
//
//  Created by WJ on 16/12/24.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class PersonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)

        let p = Person()
        print(p.name ?? "lisi")
        
        
//        let p2 = Person(dict: ["name": "张" as AnyObject])
//        print(p2.name ?? "mmm")
        
        let p3 = Person(dict: ["name": "zhangsan" as AnyObject, "age": 10 as AnyObject])
        
        print("\(p3.name)   \(p3.age)")
        
        
        
        print(Person.propertyList())
        
    }


}
