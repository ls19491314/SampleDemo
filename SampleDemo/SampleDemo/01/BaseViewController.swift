//
//  ViewController.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/9.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.qmui_random()
        // Do any additional setup after loading the view.
        initView()
    }

    func initView() {
        
        if let vc = self.revealViewController() {
            view.addGestureRecognizer(vc.panGestureRecognizer())
        }
        
        
    }
}

