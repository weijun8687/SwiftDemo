//
//  LoadBaidu.swift
//  Demo1
//
//  Created by WJ on 16/12/27.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class LoadBaidu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        let url = URL(string: "https://baidu.com")
        
        URLSession.shared.dataTask(with: url!) {(data , _, error) in
            
//            if (error != nil){
//                print("加载失败")
//                return
//            }
//            let html = String(data: data!, encoding: .utf8)

            
            guard let data = data else{
                print("加载失败")
                return
            }
            
            let html = String(data: data, encoding: .utf8)
            print(html ?? "gvj")
            
        }.resume()
    }

}
