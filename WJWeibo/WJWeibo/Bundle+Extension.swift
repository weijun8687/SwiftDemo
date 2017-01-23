//
//  Bundle+Extension.swift
//  WJWeibo
//
//  Created by WJ on 17/1/13.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit

extension Bundle{
    
    var namespace: String{
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
