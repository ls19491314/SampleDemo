//
//  LeftController.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/9.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit
import QMUIKit

class LeftController: BaseViewController {
    
    let datas:[[String:Any]] = [
        ["下拉头部变大":Demo01Controller()],
         ["1111":Demo01Controller()],
         ["22222":Demo01Controller()]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    lazy var tableView:UITableView = {
        let tv = UITableView.init(frame: .zero, style: .plain)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    override func initView() {
        tableView.frame = CGRect(x: 0, y:44 , width: view.qmui_width, height: view.qmui_height-44)
        view.addSubview(tableView)
        
    }
}
extension LeftController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let data = datas[indexPath.row]
        cell.textLabel?.text = data.keys.first
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let data = datas[indexPath.row]
        var desVc:UIViewController?
        switch indexPath.row {
        case 0:
            desVc = Demo01Controller()
        default:
            break
        }
        if let vc = desVc , let resVc = self.revealViewController(){
            resVc.pushFrontViewController(vc, animated: true)
        }
        
    }
}
