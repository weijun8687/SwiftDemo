//
//  ViewController.swift
//  WJWeibo
//
//  Created by WJ on 17/1/13.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class ViewController: WJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        setupUI()

        title = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }
    
     @objc fileprivate func showNext() {
        let vc = ViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        getData()
        
    }

    //MARK: - 获取 Setting.bundle 中的数据
    func getData() {
        let defaults = UserDefaults.standard;
        print(defaults.object(forKey: "username") ?? "aaa")
        print(defaults.object(forKey: "aihao") ?? "bbb")

        let sss: Bool = (defaults.object(forKey: "maritalStatus") != nil);
        print("sss %d",sss);
    }
    
}


extension ViewController{
    
    override func setupTableView() {
        
        super.setupTableView()
        // 系统自定义view方法
//        let navBtn: UIButton = UIButton.yw_textButton("下一个", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        navBtn.addTarget(self, action: #selector(showNext), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navBtn)
        
        // 自己封装的方法
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))

        // 系统的创建方法
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(showNext))

    }
    
}
