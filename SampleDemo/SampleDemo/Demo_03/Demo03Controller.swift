//
//  Demo03Controller.swift
//  SampleDemo
//
//  Created by shen li on 2019/10/18.
//  Copyright © 2019 listen. All rights reserved.
//

import UIKit
import Cards

class Demo03Controller: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        
        // Aspect Ratio of 5:6 is preferred
        let card = CardHighlight(frame: CGRect(x: 10, y: 30, width: 200 , height: 240))

        card.backgroundColor = UIColor(red: 0, green: 94/255, blue: 112/255, alpha: 1)
        card.icon = UIImage(named: "flappy")
        card.title = "Welcome \nto \nCards !"
        card.itemTitle = "Flappy Bird"
        card.itemSubtitle = "Flap That !"
        card.textColor = UIColor.white
            
        card.hasParallax = true
            
        let cardContentVC = UIViewController()
        cardContentVC.view.backgroundColor = .red
        
        card.shouldPresent(cardContentVC, from: self, fullscreen: false)
            
        view.addSubview(card)
        
    }
    



}
