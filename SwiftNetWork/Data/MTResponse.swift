//
//  MTResponse.swift
//  SwiftNetWork
//
//  Created by MTShawn on 2018/8/29.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit
import ObjectMapper


struct MTHomeHeader : Codable{
    var group_name : String
    var group_icon : String
    var data       : [MTLData]?
    
    struct MTLData : Codable{
        var label   : String
        var icon    : String
        var status  : Int
        var seqid   : Int
        var des     : String
    }
}

class MTResponse: Mappable {
    var group_name : String?
    var group_icon : String?
    var data       : [MTServi]?
    required init?(map: Map) {
        
    }
    init (){
        
    }
    func mapping(map: Map) {
        group_name <- map["group_name"]
        group_icon <- map["group_icon"]
        data       <- map["data"]
    }
    
}

class MTServi : Mappable{
    var label  : String?
    var des    : String?
    
    required init?(map: Map) {
        
    }
    init (){
        
    }
    func mapping(map: Map) {
        label <- map["label"]
        des   <- map["des"]
    }
    
    
}


struct MTServicesModel : Codable {
    var group_name : String
    var group_icon : String
    var data       : [MTData]
    
    
    struct MTData : Codable{
        var label   : String
        var icon    : String
        var status  : Int
        var seqid   : Int
        var des     : String
    }
    
}
