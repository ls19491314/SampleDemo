//
//  AppDelegate.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/9.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit
@_exported import SnapKit
@_exported import QMUIKit
@_exported import SWRevealViewController

#if DEBUG
    import CocoaDebug
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
       let window = UIWindow(frame: UIScreen.main.bounds)
        
        let leftVC = LeftController()
        
        let mainVC = BaseViewController()
        let vc = SWRevealViewController.init(rearViewController: leftVC, frontViewController: mainVC)
        vc?.rearViewRevealWidth = 230
        vc?.setFrontViewPosition(.left, animated: true)
        window.rootViewController = vc
        
        
        self.window = window
        self.window?.makeKeyAndVisible()
        
       #if DEBUG
            CocoaDebug.enable()
        #endif
        return true
    }
    public func print<T>(file: String = #file, function: String = #function, line: Int = #line, _ message: T, color: UIColor = .white) {
        #if DEBUG
            swiftLog(file, function, line, message, color, false)
        #endif
    }
   


}

