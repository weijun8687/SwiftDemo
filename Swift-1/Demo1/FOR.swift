//
//  FOR.swift
//  Demo1
//
//  Created by WJ on 16/12/11.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class FOR: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        demo()
    }
    
    func demo() {
        // [0,10)
        for i in 0..<10 {
            print(i)
        }
        
        print("---------")
        
        // [0,10]
        for i in 0...10 {
            print(i)
        }
        
        print("***********")
        // reversed  反转
        for i in (0..<10).reversed() {
            print(i)
        }
        
    }



}
