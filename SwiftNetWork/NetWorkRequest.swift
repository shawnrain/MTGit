//
//  NetWorkRequest.swift
//  SwiftNetWork
//
//  Created by MTShawn on 2018/8/29.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit
import Alamofire
import Moya


class NetWorkRequest{
    
    class func request(){
//        HttpRequest.loadData(API: MTHomeApi.self, target: .Banner(uaid: "20006"), success: { (result) in
//
//        }) { (code, error) in
//
//        }
        HttpRequest.loadData(API: MTHomeApi.self, target: .Services(uaid: "20006"), success: { (response) in
            
        }) { (errcode, errstr) in
            
        }
        
    }
}

class WebServices {
           
   
}
