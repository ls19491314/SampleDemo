//
//  MainViewController.swift
//  SampleDemo
//
//  Created by listen on 2019/10/25.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    var datasController:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0 ..< 5 {
            let vc = UIViewController()
            
            let lable = UILabel()
            lable.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
            lable.text = "index:\(index)"
            lable.textColor = .red
            lable.font = UIFont.qmui_lightSystemFont(ofSize: 23)
            vc.view.addSubview(lable)
            datasController.append(vc)
            
        }
        
        view.backgroundColor = UIColor.qmui_random()
        
        
        let top = QMUIHelper.safeAreaInsetsForDeviceWithNotch().top
        addChild(pageViewController)
        
       pageViewController.view.frame = CGRect(x: 0, y: top, width:QMUIHelper.applicationSize().width , height: QMUIHelper.applicationSize().height-2*top)

        view.addSubview(pageViewController.view)
        pageViewController.setViewControllers([datasController[0]], direction: .forward, animated: true) { (flag) in
            
        }
        // Do any additional setup after loading the view.
    }
    
    lazy var pageViewController:UIPageViewController = {
        let page = UIPageViewController.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        page.dataSource = self
        page.view.backgroundColor = UIColor.lightText
        return page
    }()


}
extension MainViewController:UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var index = datasController.firstIndex(of: viewController) else {
            return nil
        }
        index -= 1
        if index < 0 {
            index = datasController.count - 1
        }
        return datasController[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var index = datasController.firstIndex(of: viewController) else {
            return nil
        }
        index += 1
        if index > datasController.count - 1 {
            index = 0
         }
        return datasController[index]
    }
    
    
}
extension MainViewController:UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return .all
    }
}
