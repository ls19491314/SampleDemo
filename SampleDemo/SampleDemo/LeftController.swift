//
//  LeftController.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/9.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit

class LeftController: BaseViewController {
    
    let data:[[String:Any]] = [
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    lazy var tableView:UITableView = {
        let tv = UITableView.init(frame: .zero, style: .plain)
        return tv
    }()
    override func initView() {
        
    }
}
