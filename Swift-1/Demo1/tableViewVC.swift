//
//  tableViewVC.swift
//  Demo1
//
//  Created by WJ on 16/12/15.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class tableViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupUI()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = "acbalcanl  \(indexPath.row)"
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func setupUI() {
        
        let tv = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tv)
        // swift 中没有遵循协议是错误的
        tv.dataSource = self
        tv.delegate = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
//        tv.estimatedRowHeight = 44
//        tv.rowHeight = UITableViewAutomaticDimension;
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        
        
    }
}
