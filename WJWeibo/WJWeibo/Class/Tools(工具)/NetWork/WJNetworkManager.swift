//
//  WJNetworkManager.swift
//  WJWeibo
//
//  Created by WJ on 17/2/8.
//  Copyright © 2017年 WJ. All rights reserved.
//

import UIKit
// 导入的是第三方框架的文件及名字
import AFNetworking


let appkey = "1743792288"
let appSecret = "565be51eadbbcbc93e614af8c0c78b25"
let access_token = "2.00GQdKRExisNREccd171a345gX39KC"


enum WJHTTPMethod {
    case GET
    case POST
}

class WJNetworkManager: AFHTTPSessionManager {

    // 单例
    static let shareManager: WJNetworkManager = {
        // 实例化对象
        let instance = WJNetworkManager()
        // 设置响应反序列化支持的类型
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return instance
    }()
    
    
    /// 封装 AFN 的 GET/ POST 请求方法
    ///
    /// - Parameters:
    ///   - method: GET / POST
    ///   - URLString: URLString
    ///   - parameters: 参数字典
    ///   - completion: 完成回调 (json(字典/数组), 是否成功)
    func request(method: WJHTTPMethod = .GET, URLString: String, parameters: [String: Any], completion:@escaping (_ json: Any? , _ isSuccess: Bool)->()) {
        
        
        let success = {(task: URLSessionDataTask, json:Any?)->() in
            completion(json, true)
        }
        
        let failure = {(task: URLSessionDataTask?, error: Error)->() in
            completion(nil, false)
        }
        
        
        if method == .GET {
            
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else{
            
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
    
}
