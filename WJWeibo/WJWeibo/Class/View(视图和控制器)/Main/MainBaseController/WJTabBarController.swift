//
//  WJTabBarController.swift
//  WJWeibo
//
//  Created by WJ on 17/1/13.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class WJTabBarController: UITabBarController {
    
    // MARK: -中间的加号按钮
    lazy var composeBtn: UIButton = UIButton.yw_imageButton("tabbar_compose_icon_add",
                                                                    backgroundImageName: "tabbar_compose_button")

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置控制器
        setUpChildControllers()
        // 设置中间加号按钮
        setupComposeButton()
        
    }
    
    
    /// 使用代码控制设备的方向, 可以在横屏的时候单独处理
    // 设置支持的方向之后, 当前的自控制器及自控制器都会遵守这个方向
    // 如果是播放视频,通常都是通过 modal 展现出来的
    // portrait : 竖屏  (肖像)
    // landspace  : 横屏  (风景画)
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    

    
    //objc 可以在 OC 状态下 使用 消息机制
    @objc fileprivate func composeBtnAction() {
        print("ckabcan;xa;")
    }
}


// MARK: - 视图新特性
// extension 类似于 OC 中的分类, 在Swift 中用来切分代码块
// 把相近功能的代码放在一个 extension 中,便于维护
// 注意: 和 OC 中的分类一样, extension 不能定义属性
extension WJTabBarController{
    
    
    // fileprivate 在本文件中可以访问
    // private 在作用域中可以被访问(真正的私有)
    // public 标识的类是不能被继承的, public 标识的方法是不能被重写的(即: override),但是可以被访问
    // open 标识的类可以被继承, open 标识的方法在任何地方都可以被重写
    // final 在任何地方都不能被重写(override)
    // 类方法的权限不能大于类的权限
    
    fileprivate func setupComposeButton(){
        tabBar.addSubview(composeBtn)
        
        // 控制器的个数
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        
        // insetby 在左边偏移两个 w 的距离, 向右偏移两个 w 的距离(两遍都缩进)
        composeBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        composeBtn.addTarget(self, action: #selector(composeBtnAction), for: .touchUpInside)
        
        print("中间按钮的宽度: + \(composeBtn.bounds.width)")
        
    }
    
    fileprivate func setUpChildControllers(){
        
        // 1.获取沙盒路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        
        // 2.加载data
        var data = NSData(contentsOfFile: jsonPath)
        
        // 如果沙盒中没有数据的话,则加载Bundle中的数据
        if data == nil {
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        
        // 反序列化json串
        guard let ary = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: Any]] else{
            return
        }
        

        // 在 Bundle 中加载配置的 json
        // 1.路径  2.加载nadata 3.反序列化转换成数组
//        guard let path = Bundle.main.path(forResource: "main.json", ofType: nil),
//            let data = NSData(contentsOfFile: path),
//            let ary = try? JSONSerialization.jsonObject(with: data as Data, options: []) as! [[String: Any]]
//            else{
//            return
//        }
        
        
        
//        let ary: [[String: Any]] = [
//            ["clsName":"WJHomeViewController", "title":"首页", "imageName":"home","visitorInfo":["imageName":"", "message":"关注一些人，回这里看看有什么惊喜"]],
//            ["clsName":"WJMessageViewController", "title":"消息", "imageName":"message_center", "visitorInfo":["imageName":"visitordiscover_image_message", "message":"登陆后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
//            ["clsName":"UIViewcontroller"],
//            ["clsName":"WJDiscoverViewController", "title":"发现", "imageName":"discover", "visitorInfo":["imageName":"visitordiscover_image_message", "message":"登陆后，最新、最热的微博尽在掌握中，不会再于实事潮流擦肩而过"]],
//            ["clsName":"WJProfileViewController", "title":"我的", "imageName":"profile", "visitorInfo":["imageName":"visitordiscover_image_profile", "message":"登陆后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
//
//        ]
        
        // 将数据写入到桌面文件
//        (ary as NSArray).write(toFile: "/Users/wj/Desktop/Demo.plist", atomically: true)
        
        // 数组 -> json 序列化
//        let jsonDate = try! JSONSerialization.data(withJSONObject: ary, options: .prettyPrinted)
//        // 将 json 串写到桌面
//        (jsonDate as NSData).write(toFile: "/Users/wj/Desktop/main.json", atomically: true)
        
        var viewControllerArr = [UIViewController]()
        
        for dic in ary! {
            viewControllerArr.append(controller(dic: dic))
        }
        
        viewControllers = viewControllerArr
    }
    
    
    
    /// 通过字典创建控制器
    ///
    /// - Parameter dic: 信息字典 [clsName, title, imageName]
    /// - Returns: 返回子控制器
    private func controller(dic: [String: Any]) -> UIViewController {
        
        guard let clsName = dic["clsName"] as? String,
            let title = dic["title"] as? String,
            let imageName = dic["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? WJBaseViewController.Type,
        let visitorInfo = dic["visitorInfo"] as? [String: String]
        
            else {
               return UIViewController()
        }
        
        // 创建视图控制器
        let vc = cls.init()
        vc.title = title
        vc.visitorInfo = visitorInfo
        
        // 设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        // 设置高亮状态下的image, 并且不被渲染
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        // 设置 tabbar 高亮状态下的字体颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        
        // 设置 tabbar 字体大小,系统默认的为 12, 只需要修改 normal状态下的大小就可以
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12.0)], for: UIControlState(rawValue: 0))
        
        let nav = WJNavigationController(rootViewController: vc)
        return nav
        
    }
}
