//
//  ViewController.swift
//  TouchIDDemo
//
//  Created by Erickson on 16/4/8.
//  Copyright © 2016年 paiyipai. All rights reserved.
//


import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let authent = LAContext()
        let error:NSErrorPointer = nil
        
        
        let policy = LAPolicy(rawValue:Int(kLAPolicyDeviceOwnerAuthentication))
        if authent.canEvaluatePolicy(policy!, error: error) {
            authent.evaluatePolicy(policy!, localizedReason: "需要验证您的指纹来确认您的身份信息", reply: { (success, error) in
                if success {
                    print("成功了")
                } else {
                    print(error?.userInfo)
                }
                
            })
        }
        
        
    }

}
