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
    import DoraemonKit
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
       let window = UIWindow(frame: UIScreen.main.bounds)
        
       func demo_01() {
             let leftVC = LeftController()
             
             let mainVC = CollectionDemoView()

             let vc = SWRevealViewController.init(rearViewController: leftVC, frontViewController: mainVC)
             vc?.rearViewRevealWidth = window.qmui_width*0.8
             vc?.setFrontViewPosition(.left, animated: true)
            window.rootViewController = vc
        }
       
        func demo_02() {
            
            
            let tabbar = TabBarCOntroller()
            
            window.rootViewController = tabbar
        }
      
        demo_02()

        self.window = window
        self.window?.makeKeyAndVisible()
        
       #if DEBUG
              DoraemonManager.shareInstance().install()
          #endif
        return true
    }
//    public func print<T>(file: String = #file, function: String = #function, line: Int = #line, _ message: T, color: UIColor = .white) {
//        #if DEBUG
//            swiftLog(file, function, line, message, color, false)
//        #endif
//    }
   


}

