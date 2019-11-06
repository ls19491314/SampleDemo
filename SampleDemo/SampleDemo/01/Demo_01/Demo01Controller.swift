//
//  Demo01Controller.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/9.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit

class Demo01Controller: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func initView() {
        super.initView()
        
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
  
    lazy var collectionView:UICollectionView = {
        let layout = Demo01FlowLayout()
        layout.itemSize = CGSize(width: view.qmui_width, height: 40)
        layout.headerReferenceSize = CGSize(width: view.qmui_width, height: 200)
        let coll = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        coll.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        coll.register(Demo01HeadView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Demo01HeadView")
        coll.backgroundColor = .white
        coll.dataSource = self
        coll.delegate = self
        return coll
    }()
}
extension Demo01Controller:UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.qmui_random()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Demo01HeadView", for: indexPath)
            return header
        }
        return UICollectionReusableView.init()
    }
    
}
class Demo01FlowLayout:UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let offset : CGPoint = collectionView?.contentOffset ?? .zero
        let attrs : [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect) ?? []
        if offset.y < 0 {
            let deltaY  = CGFloat(fabsf(Float(offset.y)))
            
            for item in attrs {
                if let kind = item.representedElementKind,kind == UICollectionView.elementKindSectionHeader {
                    let headerSize = headerReferenceSize
                    var headRect = item.frame
                    headRect.size.width = headerSize.width + deltaY
                    headRect.size.height = headerSize.height + deltaY
                    headRect.origin.x = headRect.origin.x - deltaY/2
                    headRect.origin.y = headRect.origin.y - deltaY
                    item.frame = headRect
                    break
                }
                
            }
        }
        
        return attrs
    }
}
class Demo01HeadView: UICollectionReusableView {
    let image = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.qmui_random()
        
        image.image = UIImage(named: "icon_read_taskad_day")
        image.backgroundColor = .red
        addSubview(image)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
