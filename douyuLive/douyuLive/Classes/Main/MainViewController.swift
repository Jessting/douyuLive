//
//  MainViewController.swift
//  douyuLive
//
//  Created by FDC on 2019/5/13.
//  Copyright © 2019 FDC. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 添加四个子控制器
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
    }
    
    private func addChildVc( storyName: String ) {
        // 1 通过storyboard 获取控制器
        // 可选类型在swift中很重要
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        // 2 将childVc 作为子控制器
         addChild(childVc)
    }

  
}
