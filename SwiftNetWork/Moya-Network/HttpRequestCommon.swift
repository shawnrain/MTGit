//
//  HttpRequestCommon.swift
//  SwiftNetWork
//
//  Created by MTShawn on 2018/8/29.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit
import Alamofire
import Moya

class HttpRequestCommon {
    static var verbose: Bool = true
    
    static func manager() -> Alamofire.SessionManager{
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 15 // timeout
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.adapter = CustomRequestAdapter()
        return manager
    }
    private class CustomRequestAdapter: RequestAdapter {
        public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
            var urlRequest = urlRequest
            urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
            return urlRequest
        }
    }
    
    
}
