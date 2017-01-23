//
//  Bundel+Extion.swift
//  反射机制
//
//  Created by WJ on 17/1/12.
//  Copyright © 2017年 WJ. All rights reserved.
//

import Foundation

extension Bundle{
    
//    func namespace() -> String {
//     
////        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    var namespace: String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
