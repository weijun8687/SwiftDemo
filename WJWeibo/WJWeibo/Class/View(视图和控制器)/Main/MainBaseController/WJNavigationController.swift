//
//  WJNavigationController.swift
//  WJWeibo
//
//  Created by WJ on 17/1/13.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class WJNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 隐藏系统自带的 navigationBar
        navigationBar.isHidden = true
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            // VC 为将要push 出来的页面
            if let vc = (viewController as? WJBaseViewController) {
                var title = "返回"
                
                // 当push 出的页面为第二级时, vc的title 为第一级的 title
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParentVC), isBack: true)
                
            }
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    // 返回上一级页面
    @objc private func popToParentVC(){
        popViewController(animated: true)
    }

}
