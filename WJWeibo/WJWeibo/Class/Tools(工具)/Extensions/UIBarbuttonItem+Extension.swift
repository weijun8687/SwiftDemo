//
//  UIBarbuttonItem+Extension.swift
//  WJWeibo
//
//  Created by WJ on 17/1/17.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    

    convenience init(title:String, fontSize:CGFloat = 16, target:Any, action:Selector, isBack:Bool = false) {
        
        let navBtn: UIButton = UIButton.yw_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        navBtn.addTarget(target, action: action, for: .touchUpInside)
        
        let imageName = "navigationbar_back_withtext"
        
        if isBack {
            navBtn.setImage(UIImage.init(named: imageName), for: .normal)
            navBtn.setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)
            navBtn.sizeToFit()
        }
        
        self.init(customView:navBtn)
    }
}
