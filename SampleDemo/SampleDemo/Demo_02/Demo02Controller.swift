//
//  Demo02Controller.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/10.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit

class Demo02Controller: BaseViewController {

    var datas:[NodeModel] = []
    var showDatas:[NodeModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func initView() {
        super.initView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        let item_china = NodeModel.init(pareID: -1, nodeId: 0, depath: 0, expand: true, data: "中国")
            let item_henan = NodeModel.init(pareID: 0, nodeId: 0371, depath: 1, expand: false, data: "河南")
                let item_zhumdian = NodeModel.init(pareID: 0371, nodeId: 0396, depath: 2, expand: true, data: "驻马店")
                let item_zhengzhou = NodeModel.init(pareID: 0371, nodeId: 0397, depath: 2, expand: true, data: "郑州")
        datas = [item_china,item_henan,item_zhumdian,item_zhengzhou]
        showDatas = datas
        tableView.reloadData()
    }
    lazy var tableView:UITableView = {
        let tv = UITableView.init(frame: .zero, style: .plain)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.dataSource = self
        tv.delegate = self
        tv.backgroundColor = .white
        tv.tableFooterView = UIView()
        return tv
    }()
}
extension Demo02Controller:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.qmui_random()
        
        let node = showDatas[indexPath.row]
        cell.indentationLevel = node.depth
        cell.indentationWidth = 30
        cell.textLabel?.text = node.data as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentNode = showDatas[indexPath.row]
        
        let startPosition = indexPath.row + 1
        var endPosition = startPosition
        
        var expand:Bool = false
        for item in datas {
            if currentNode.nodeId == item.parentId {
                item.expand = !item.expand
                if item.expand {
                    showDatas.insert(item, at: endPosition)
                    expand = true
                    endPosition += 1
                }else {
                    expand = false
                    
                }
            }
        }
    }
    
}
class NodeModel :NSObject{
    var parentId:Int = -1
    var nodeId:Int=0
    var data:Any?
    var depth:Int=0
    var expand:Bool = false
    init(pareID:Int,nodeId:Int,depath:Int,expand:Bool,data:Any?) {
        super.init()
        self.parentId = pareID
        self.nodeId = nodeId
        self.depth = depath
        self.expand = expand
        self.data = data
        
    }
    
}
