//
//  AlertViewController.swift
//  Demo1
//
//  Created by WJ on 16/7/28.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

import CocoaLumberjack

class AlertViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let button = UIButton(frame: CGRect(x: 40, y: 40, width: 40, height: 40))
        
        self.view.addSubview(button)
        
        button.backgroundColor = UIColor.darkGray
        button.setTitle("按钮", for: UIControlState.normal)
        button.setTitleColor(UIColor.brown, for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.selected)
        
        button.layer.cornerRadius = 5.0
        
        button.addTarget(self, action: #selector(AlertViewController.clickBtn), for: UIControlEvents.touchUpInside)

        defaultDebugLevel = DDLogLevel.info
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DDLogInfo("mmmmmmmmmmmm")
    }
    
    
    // MARK: - alertView弹窗  (上面会出现一条灰线)
    // FIXME: jcanlm
    // TODO: bckaj
    
    func clickBtn() {
        print("ertyuio")
        
        let alertTitle = "提示"
        // 设置title颜色
        let attrubutedTextTitle = NSMutableAttributedString(string: alertTitle)
        attrubutedTextTitle.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSRange(location: 0, length: 2))
        
        let alertMessage = "才看见你的快餐店才看出"
        // 设置提示信息的颜色
        let attrubutedText = NSMutableAttributedString(string: alertMessage)
        attrubutedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.orange, range: NSMakeRange(3, 3))
        
        
        let alertButton = UIAlertAction.init(title: "ok", style: UIAlertActionStyle.default) { (self) in
            print("点击ok")
        }
        
        let alert = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.setValue(attrubutedTextTitle, forKey: "attributedTitle")
        alert.setValue(attrubutedText, forKey: "attributedMessage")
        alert.addAction(alertButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
