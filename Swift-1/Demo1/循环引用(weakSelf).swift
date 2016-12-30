//
//  循环引用(weakSelf).swift
//  Demo1
//
//  Created by WJ on 16/12/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

public let ScreenWidth = UIScreen.main.bounds.width
public let ScreenHeight = UIScreen.main.bounds.height

class _____weakSelf_: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 弱引用
        // 1.
        weak var weakSelf = self
        print(weakSelf?.view ?? "666")
        

        // 2.
        loadData { [weak self] in
            print(self?.view ?? "nnnn")
        }
        
        demo1 { [weak self] (str) in
            print(str)
            print(self?.view ?? "hhh")
        }

    }

    func loadData(completion:() -> ()) -> () {
//        let str = "vabkjbacnla"
        
        completion()
    }
    
    
    func demo1(completion:(String) -> ()) -> () {
        completion("fghkjlkl")
    }
}
