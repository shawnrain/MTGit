//
//  ViewController.swift
//  SwiftNetWork
//
//  Created by MTShawn on 2018/8/29.
//  Copyright © 2018年 MT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetWorkRequest.request()
        MTFanXing().creat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

