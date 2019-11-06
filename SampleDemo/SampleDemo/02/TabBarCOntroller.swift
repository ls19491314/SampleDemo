//
//  TabBarCOntroller.swift
//  SampleDemo
//
//  Created by shen li on 2019/11/6.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController
class TabBarCOntroller: RAMAnimatedTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  viewControllers = [firstVC,secondVC,thirdVC]
        firstVC.tabBarItem = firstTabbarItem
        secondVC.tabBarItem = secondTabbarItem
        thirdVC.tabBarItem = thirdTabbarItem
        
       
        setViewControllers([firstVC,secondVC,thirdVC], animated: false)
       
    
    }

    let firstVC = TabBarSubFirstController()
   
    
    
    let secondVC = TabBarSubSecondController()
    
    let thirdVC = TabBarSubThirdController()

    let animation:RAMBounceAnimation = RAMBounceAnimation()
    
    
    let firstTabbarItem:RAMAnimatedTabBarItem = {
       let tab = RAMAnimatedTabBarItem()
        tab.title = "test01"
        tab.image = UIImage(named: "001")
        tab.animation = RAMFumeAnimation()
        return tab
    }()
    let secondTabbarItem:RAMAnimatedTabBarItem = {
       let tab = RAMAnimatedTabBarItem()
         tab.title = "test02"
         tab.image = UIImage(named: "002")
        tab.animation = RAMBounceAnimation()
        return tab
    }()
    let thirdTabbarItem:RAMAnimatedTabBarItem = {
       let tab = RAMAnimatedTabBarItem()
         tab.title = "test03"
         tab.image = UIImage(named: "003")
        tab.animation = RAMRotationAnimation()
        return tab
    }()
}
class TabBarSubFirstController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.qmui_random()
    }
}
class TabBarSubSecondController:UIViewController {
    override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = UIColor.qmui_random()
      }
}
class TabBarSubThirdController:UIViewController {
    override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = UIColor.qmui_random()
      }
}



