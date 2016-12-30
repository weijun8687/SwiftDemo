//
//  GCD.swift
//  Demo1
//
//  Created by WJ on 16/11/12.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class GCD: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        // 调用没有返回数据的闭包
        loadData()
        
        // 调用有返回数据的闭包
        loadData2 { (result) in
            print("异步返回的数据22:\(result)");
        }
        
        
    }
    
    
    
    
    // 闭包
    func loadData() -> Void {
        // 异步线程
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
        }
        
        Thread.sleep(forTimeInterval: 1.0);
        
        // 回到主线程
        DispatchQueue.main.async {
            print("主线程更新 \(Thread.current)")
        }
    }
    
        
    // 闭包  有返回数据
    func loadData2(completion: @escaping (_ result: [String]) -> ()) -> () {
        // 异步请求数据
        DispatchQueue.global().async {
            print("异步请求数据")
        }
        
        Thread.sleep(forTimeInterval: 1.0)
        
        let json = ["新闻", "八卦", "头条"]
        
        DispatchQueue.main.async(execute:{
            completion(json)
        }

        )
//        completion(json)

    }
}
