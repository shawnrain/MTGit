//
//  MTHome.swift
//  SwiftNetWork
//
//  Created by MTShawn on 2018/8/29.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit
import Moya


enum MTHomeApi{
    case Banner(uaid:String)
    case Services(uaid:String)
}

extension MTHomeApi : TargetType{
    var path: String {
        switch self {
        case .Banner:
            return "banner"
        case .Services:
            return "service_category"
        }
    }
    
    var task: Task {
        switch self {

        case let .Banner(uaid):
            return .requestParameters(parameters: ["uaid":uaid,"sign":getPrivateKey(params: ["uaid":uaid])], encoding: URLEncoding.default)
        case let .Services(uaid):
            return .requestParameters(parameters: ["uaid":uaid,"sign":getPrivateKey(params: ["uaid":uaid])], encoding: URLEncoding.default)
        }
    }
        
    func getPrivateKey(params:[String: String]) -> String{
        let allKey = params.keys
        var values = [Any].init()
        for  key in allKey {
            values.append(params[key] ?? "")
        }
        var singStr = String()
        for (index,item) in allKey.enumerated(){
            print("index===\(index),item===\(item)")
            singStr.append(String.init(format: "%@=%@", item,params[item]!))
        }
        singStr.append(getTimeInterval())
        singStr.append("key=AppMelonBlock2017")
        
        let strd : NSString = NSString.init(string: singStr)
        return strd.md5().lowercased() as String
    }
    func getTimeInterval() -> String{
        let time = Date.init().timeIntervalSince1970 / 10
        var str = "time="
        str.append(String(stringInterpolationSegment: Int(time)))
        return str
    }
    
}





class MTHome: NSObject {

}
