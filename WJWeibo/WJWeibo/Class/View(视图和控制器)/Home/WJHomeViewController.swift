//
//  WJHomeViewController.swift
//  WJWeibo
//
//  Created by WJ on 17/1/15.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit
import AFNetworking

private let cellID = "cellID"

class WJHomeViewController: WJBaseViewController {

    fileprivate lazy var stateList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setupUI()
    }


    func showNext() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func loadData() {
        
        
        let urlSring = "https://api.weibo.com/2/statuses/public_timeline.json"
        let param = ["access_token" : access_token]
        
//        WJNetworkManager.shareManager.get(urlSring, parameters: param, progress: nil, success: {(_, json) in
//            print(json ?? "kjknl")
//        }) {(_, error) in
//            
//            print("网络请求失败 \(error)")
//        }
        
        WJNetworkManager.shareManager.request(URLString: urlSring, parameters: param){(json, isSuccess) in
            print(json ?? "")
        }
        
        
        refreshController?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            
            for i in 0..<20 {
                if self.isPullUp{
                    // 下拉刷新
                    self.stateList.append("上拉刷新 \(i)")
                }else{
                    // 上拉刷新
                    self.stateList.insert(i.description, at: 0)
                }
            }
            self.refreshController?.endRefreshing()

            self.isPullUp = false
            self.tableView?.reloadData()


        })
        
        
    }
    
}

extension WJHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = stateList[indexPath.row]
        
        return cell
    }
}

extension WJHomeViewController{
    override func setupTableView() {
  
        super.setupTableView()
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showNext))
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}
