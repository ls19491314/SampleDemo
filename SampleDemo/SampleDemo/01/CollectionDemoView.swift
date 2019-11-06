//
//  CollectionDemoView.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/28.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit

class CollectionDemoView: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.qmui_random()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let coll = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        
        coll.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        coll.dataSource = self
        coll.delegate = self
        return coll
    }()
}
extension CollectionDemoView:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.qmui_random()
        let titiLable = UILabel()
        titiLable.frame = CGRect(x: 10, y: 20, width: 100, height: 40)
        titiLable.text = "我是\(indexPath.row)"
        cell.addSubview(titiLable)
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = QMUIHelper.applicationSize().width/2 - 2
        
        if indexPath.row == 0 {
             return CGSize(width: width, height:width)
        }else{
             return CGSize(width: width, height:width/2-10)
        }
       
           
       }
}
