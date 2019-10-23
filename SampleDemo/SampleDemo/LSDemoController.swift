//
//  LSDemoController.swift
//  ChengYu
//
//  Created by shen li on 2019/8/15.
//  Copyright © 2019 Shenzhen youvision technology co. LTD. All rights reserved.
//

import UIKit
import QMUIKit

class LSDemoController: QMUICommonViewController {

    let maxHeight:CGFloat = 230
    let minHeight:CGFloat = 80
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
             automaticallyAdjustsScrollViewInsets = false
            // Fallback on earlier versions
        }
        tableView.tableHeaderView = UIView()
        tableView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        view.addSubview(headerView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
       // tableView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
    }
//    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if let key = keyPath,key == "contentOffset" {
//          //  let offset = change?[NSKeyValueChangeKey.newKey] as? CGPoint ?? .zero
//
//           // print("offSet:\(offset)")
//        }
//    }
    lazy var tableView:UITableView = {
        let tv = UITableView.init(frame: .zero, style: .plain)
        tv.estimatedSectionHeaderHeight = 0
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.rowHeight = 60
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
 
    lazy var headerView:UIView = {
       let tv = UIView()
        tv.backgroundColor = .lightGray
        tv.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: maxHeight)
        let lable = UILabel()
        lable.textAlignment = .center
        lable.text = "hahah"
        tv.addSubview(lable)
        lable.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-10)
        }
        return tv
    }()
    deinit {
       // tableView.removeObserver(self, forKeyPath: "contentOffset")
    }
}
extension LSDemoController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor.qmui_random()
        
        return cell
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return headerView.qmui_height
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offY = scrollView.contentOffset.y
       // headerView.height = headerView.qmui_height - offY
        if offY >= maxHeight - minHeight {
            return
        }
        if offY <= 0 && offY <= -maxHeight  {
            headerView.qmui_height = maxHeight + (-offY-maxHeight)
        }else if offY < 0 && offY > -maxHeight && offY < -minHeight {
            headerView.qmui_height =  -offY
        }else {
            headerView.qmui_height = minHeight
        }
//        headerView.frame = CGRect(x: 0, y: offY, width: kScreenWidth, height: maxHeight-offY)
//        tableView.contentInset = UIEdgeInsets(top: offY, left: 0, bottom: 0, right: 0)
        print("frame:\(headerView.frame) , off:\(offY)")
    }
}
