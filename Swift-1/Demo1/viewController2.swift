//
//  viewController2.swift
//  Demo1
//
//  Created by WJ on 16/7/27.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class viewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        
        
        
        var tempSum = 0
//         ... 包含上界
        for i in 1...4 {
            tempSum += i
        }
        print(tempSum)

//        self.great("bfngvhbjk.l", sex: 8)
        
        let yuanzu:(x:String, z:NSInteger) = self.great1(name: "fgfhj")
        print(yuanzu.x)
        print(yuanzu.z)
        
        // 2: 传的参数   nnn 是block传回的bool值
        self.myMethod(num: 3) { (nnn) in
            print(nnn)
        }
        
        self.myMethod2(num: 5) { (bool, str) in
            print(bool, str)
        }
        
        self.enumMethod()
        
    }
    
    // MARK: - 字符串的转换
    func stringChange() -> Void {
        var str = "wertyuisdfgh"
        
        print(str.characters.underestimatedCount)
        print(str.characters.count);
        
        let str1 = "jjj"
        print(str + str1)
        
        // 打印变量 \(变量名)
        print("\(str) time")
        // 小写变大写
        print(str.uppercased())
        
        // 大写变小写
        let StrBig = "RTYUIO"
        print(StrBig.lowercased())

    }
    
    // MARK: 枚举
    func enumMethod() -> Void {
        enum Rank: Int {
            case Ace = 1
            case AAAA = 10
            case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
            case Jack, Queen, King
            func simpleDescription() -> String {
                switch self {
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                case .King:
                    return "king"
                default:
                    return String(self.rawValue)
                }
            }
        }
        
        let ace = Rank.AAAA
        let aceValue = ace.rawValue
        print("acevalue:",aceValue)
        
        
        
    }
    
    
    
    /**
     使用block往回传数据
     
     - parameter num:         传的参数
     - parameter blockHandle: 用block返回的值
     */
    func myMethod(num:NSInteger, blockHandle:(Bool)->Void) -> Void {
        if num > 3 {
            blockHandle(true)
        }else{
            blockHandle(false)
        }
    }
    
    func myMethod2(num:NSInteger ,block:(Bool, String)-> Void) -> Void {
        if num > 3 {
            block(true, "33333")
        }else{
            block(false, "000")
        }
    }
    
    
    
    

    /**
     传参数方法
     
     - parameter name: 传字符串
     
     - returns: 返回字符串
     */
    func great(name:String) -> String {
        return name;
    }
    
    func great1(name:String) -> (String, NSInteger) {
        return (name, 1);
    }
    
    
    func great(name:String, sex:NSInteger) {
        print(name)
        print(sex)
    }
    
    // 传进去的参数个数是可变的
    func great2(numbers:NSInteger...) -> NSInteger {
        var temp = 0
        for num in numbers {
            temp += num
        }
        return temp
    }
    
    
    /**
     switch方法
     */
    func switchMethod() {
        /**
         *  switch case 中必须包含default , 不用写break,程序会自动跳转出去
         */
        let vegetable = "cucumber"

        switch vegetable {
        case "celery":
            let vegetableComment = "Add some raisins and make ants on a log."
            print(vegetableComment)
        case "cucumber", "watercress":
            let vegetableComment = "That would make a good tea sandwich."
            print(vegetableComment)
        case let x where x.hasSuffix("pepper"):
            // 字符串中存在pepper
            let vegetableComment = "Is it a spicy \(x)?"
            print(vegetableComment)
        default:
            let vegetableComment = "Everything tastes good in soup."
            print(vegetableComment)
        }

    }
    
    
}
