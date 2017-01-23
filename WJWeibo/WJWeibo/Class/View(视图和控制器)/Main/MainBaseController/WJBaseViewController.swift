//
//  WJBaseViewController.swift
//  WJWeibo
//
//  Created by WJ on 17/1/15.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

class WJBaseViewController: UIViewController {

    // 自定义navBar
    lazy var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.yw_screenWidth(), height: 64))
    
    // 访客视图的信息
    var visitorInfo: [String: String]?
    
    
    var tableView: UITableView?
    
    // 刷新控件
    var refreshController:UIRefreshControl?
    // 上拉刷新的标记
    var isPullUp = false
    
    // 用户登录的状态
    var userLogon = false
    
    
    // 自定义 navItem
    lazy var navItem:UINavigationItem = UINavigationItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }
    
    func loadData() {
        // 如果子类不实现任何方法,则默认关闭刷新控件
        refreshController?.endRefreshing()
    }
    
    /// 重写 navItem 中的 title 的 setter 方法
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }

}

extension WJBaseViewController{
    
    open func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        //MARK:- 重要
        //取消自动缩进 - 如果隐藏了导航栏 会缩进20点
        extendedLayoutIncludesOpaqueBars = false
        
        setupNavgationBar()
        
        userLogon ? setupTableView() : setupVisitorView()
    }
    
    //MARK:- 设置访客页面
    private func setupVisitorView() {
        let visitorView = WJVisitorView(frame: view.bounds)
        visitorView.visitorInfo = visitorInfo
        view.insertSubview(visitorView, belowSubview: navBar)
    }
    
    //MARK: 设置 tableView
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.backgroundColor = UIColor.brown
        view.insertSubview(tableView!, belowSubview: navBar)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        
        // MARK:- 重要
        // 设置 tableview 的缩进
//        tableView?.contentInset = UIEdgeInsetsMake(navBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        // 使用结构体有
        tableView?.contentInset = UIEdgeInsets(top: navBar.bounds.height,
                                               left: 0,
                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                               right: 0)
        
        setupRefreshControl()
    }
    
    // MARK: 设置刷新控件
    func setupRefreshControl() {
        refreshController = UIRefreshControl()
        tableView?.addSubview(refreshController!)
        refreshController?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    /// 设置导航条
    private func setupNavgationBar() {
        // 将自定义的 navBar 添加到视图上
        view.addSubview(navBar)
        // 将自定义的 item 设置给 navBar 上
        navBar.items = [navItem]
        
        // 设置 navBar 的渲染颜色 (不设置的话做push, pop 的时候导航条会很亮)
        navBar.barTintColor = UIColor.yw_color(withHex: 0xF6F6F6)
        
        // 设置导航条的字体颜色
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        // 设置导航条的背景颜色
        navBar.backgroundColor = UIColor.lightGray
        
        // 设置系统按钮的文字渲染颜色, 只对 .plain 类型的方法有效
        navBar.tintColor = UIColor.orange
        
    }
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension WJBaseViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // 在显示最后一行的时候加载新数据
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 1. 判断indexPath是否为最后一行
        // indexpath.section 最大 / indexpath.row 为最后一行
        let row = indexPath.row
        // 获取tableview 的最大section
        let section = tableView.numberOfSections - 1
        
        // tableview 没有数据时直接返回
        if row < 0 || section < 0{
            return
        }
        
        // 最后一组数据的行数
        let count = tableView.numberOfRows(inSection: section)
        // 如果是最后一行, 并且没有开始上拉刷新
        if row == count - 1 && !isPullUp {
            print("开始上拉刷新")
            isPullUp = true
            loadData()
        }
        
    }
}
