//
//  MTFanXing.swift
//  SwiftNetWork
//
//  Created by MTShawn on 2018/8/30.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

class MTFanXing: NSObject {
    func creat(){
        let lTest : Array<Int> = [1,2,3,5]
         print("数组和===\(lTest.sum())")
         let userManeger = UserManager()
      let uh =  userManeger.models(matching: .name("sunny"))
        print("=====\(uh)")
    }
}

extension Array where Element : Numeric{
    func sum() -> Element{
        return reduce(0, +)
    }
}


struct User {
    var name : String
    var age  : Int
}

protocol ModelManager {
    associatedtype Model
    associatedtype Collection: Swift.Collection where Collection.Element == Model
    associatedtype Query
    func models(matching query : Query) -> Collection
    
}


class UserManager : ModelManager{
    
    typealias Model = User
    enum Query{
        case name(String)
        case ageRange(Range<Int>)
    }
    func models(matching query: Query) -> [User] {
        let user1 = User(
            name: "sunny",
            age: 25)
        let user2 = User(
            name: "lily",
            age: 18)
        let user3 = User(
            name: "michael",
            age: 30)
        
        let users = [user1, user2, user3]
        
        switch query {
        case .name(let name):
            return users.filter({ (lUser) -> Bool in
                lUser.name == name
            })
        case .ageRange(let range):
            return users.filter({ (lUser) -> Bool in
                range ~= lUser.age
        })
      }
    }
}

