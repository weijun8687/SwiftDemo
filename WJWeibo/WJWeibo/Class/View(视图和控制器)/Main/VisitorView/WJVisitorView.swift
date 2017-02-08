//
//  WJVisitorView.swift
//  WJWeibo
//
//  Created by WJ on 17/1/19.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit


/// 访客视图
class WJVisitorView: UIView {

    
    // 根据外部的数据显示内容
    var visitorInfo:[String:String]?{
        didSet{
            
            guard let message = visitorInfo?["message"],
            let imageName = visitorInfo?["imageName"] else {
                return
            }
            
            tipLable.text = message
            
            if imageName == "" {
                startAnimation()
                return
            }
            
            iconView.image = UIImage(named: imageName)
            houseIconView.isHidden = true
            maskIconView.isHidden = true
            
        }
    }
    
    // 注册按钮
    var registerBtn: UIButton = UIButton.yw_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    // 登录按钮
    var loginBtn: UIButton = UIButton.yw_textButton("登录", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    
    // 代码调用
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // 当加载xib 的时候会调用该方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 启动动画
    private func startAnimation() {
        
        // 设置动画为旋转
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.duration = 15.0
        // 设置动画的旋转角度
        anim.toValue = M_PI * 2
        //  一直旋转
        anim.repeatCount = MAXFLOAT
        // 动画完成之后是否删除, 如果iconView被释放, 动画会一起被销毁
        anim.isRemovedOnCompletion = false
        iconView.layer.add(anim, forKey: nil)
    }
    
    // MARK: - 私有控件
    // 背景
    fileprivate lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    // 小房子
    fileprivate lazy var houseIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    // 中间的提示标签
    fileprivate lazy var tipLable: UILabel = UILabel.yw_label(withText: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜", fontSize: 16, color: UIColor.darkGray)
    
    // 遮罩
    fileprivate lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
}


extension WJVisitorView{
    
    func setupUI() {
        backgroundColor = UIColor.yw_color(withHex: 0xEDEDED)
        
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseIconView)
        addSubview(tipLable)
        addSubview(registerBtn)
        addSubview(loginBtn)
        tipLable.textAlignment = .center
        tipLable.font = UIFont.systemFont(ofSize: 14.0)
        
        // 取消 autoresizing
        for v in self.subviews {
            // 很重要
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let margin: CGFloat = 20.0
        
        
        /*
         * item: 所要布局的控件
         * attribute: 布局的属性
         * relatedBy: equal, greaterThanOrEqual, lessThanOrEqual
         * toItem: 所对照的控件
         * attribute: 对照控件的属性
         * multiplier: 倍数
         * constant: 偏移量
         */
        // 背景
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: -30))
        // 小房子
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        // 提示标签
//        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 20.0))
//        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -20.0))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .centerX, relatedBy: .equal, toItem: houseIconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 236.0))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: margin))
        
        // 注册按钮
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .left, relatedBy: .equal, toItem: tipLable, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .top, relatedBy: .equal, toItem: tipLable, attribute: .bottom, multiplier: 1.0, constant: margin))
        
        // 登录按钮
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .right, relatedBy: .equal, toItem: tipLable, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .width, relatedBy: .equal, toItem: registerBtn, attribute: .width, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: registerBtn, attribute: .top, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .bottom, relatedBy: .equal, toItem: registerBtn, attribute: .top, multiplier: 1.0, constant: -margin))

        
    }
    
}
