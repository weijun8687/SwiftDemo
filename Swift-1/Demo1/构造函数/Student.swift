//
//  Student.swift
//  Demo1
//
//  Created by WJ on 17/1/11.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class Student: NSObject {

    var name: String?
    var age: Int = 0
    var sex: String?
    
    
    convenience init?(name:String, age: Int) {
        
        if age > 100 {
            return nil
        }

        self.init()
        
        
        self.name = name
        self.age = age
        
        
    }
    
    
    
    
    
}
