//
//  MainViewController.swift
//  douyuLive
//
//  Created by FDC on 2019/5/14.
//  Copyright © 2019 FDC. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加四个storyboard
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
    }
    
    private func addChildVc(storyName: String) {
        
        // 1、通过 storyboard 获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        // 2、将 childVc 作为子控制器
        addChild(childVc)
        
    }

}
