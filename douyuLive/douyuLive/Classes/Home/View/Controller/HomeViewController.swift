//
//  HomeViewController.swift
//  douyuLive
//
//  Created by FDC on 2019/5/14.
//  Copyright © 2019 FDC. All rights reserved.

/* 首页布局-页面分析：
一、封装 PageTitleView
    1）自定义 view, 并且自定义构造函数
    2）添加子控件：UIScrollView ； 设置 TitleLabel ； 设置顶部的线段
 二、封装 PageContentView
 三、处理 PageTitleView & PageContentView 的逻辑
*/

import UIKit

// 高度由控制器自己决定
private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {

    // MASK:-懒加载属性（1、延迟加载，减少内存的消耗；2、可以解除报包的烦恼）
    private lazy var pageTitleView: PageTitleView = {
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationH, width:kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        //设置 titleViewf 的背景颜色
        // titleView.backgroundColor = UIColor.purple
        
        return titleView
    }()
    
    // MASK:-懒加载属性（1、延迟加载，减少内存的消耗；2、可以解除报包的烦恼）
    private lazy var pageContentView: PageContentView = {
        
        // 1、确定内容的 frame
        let contentH = kScreenH - kStatusBarH - kNavigationH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationH + kTitleViewH, width: kScreenW, height: contentH)
        
        // 2、确定所有的子控制器
        var childVcs = [UIViewController] ()
        
        for _ in 0..<4 {
            let vc = UIViewController()
            
            // arc4random_uniform() 是随机函数
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            
            childVcs.append(vc)
            
        }
        
        let contentView  = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        
        return contentView
    } ()
    
   // MASK:-系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置 UI 界面
        setupUI()
    }
    
}

// mark:设置首页 ui 界面
extension HomeViewController {
    private func setupUI() {
        
        // 0、不需要调整 UIScrollView 的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1、设置导航栏
        setupNavigationBar()
        
        // 2、添加 TitleView，拿到控制器 view，添加自定义配件 view
        view.addSubview(pageTitleView)
        
        // 3、添加 ContentView
        view.addSubview(pageContentView)
        // 为了能看见 ContentView，先添加一个背景颜色
        pageContentView.backgroundColor = UIColor.purple
    }
    
    // 设置首页导航栏
    private func setupNavigationBar() {
        
        // 自定义方法
        /*
        // 1、设置左侧的 Item
        let btn = UIButton()
        // 设置按钮图片
        btn.setImage(UIImage(named: "logo"), for: .normal)
        // 按钮自适应大小
        btn.sizeToFit()
        // 自定义按钮属性-customView:
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        */
        
        
        // 用便利构造函数的方法，代码简单
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        
        // 2、设置右侧的 Item
        let size = CGSize(width: 40, height: 40)
        
        // 使用便利构造函数，扩展系统类的方法，创建导航栏item
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        // 右侧三个按钮数组-BarButtonItems
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
        // 使用类方法创建自定义的item
        /*
        // 调用 UIBarButtonItem.createItem() 函数
        let historyBtnItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchBtnItem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeBtnItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
 
        // 右侧三个按钮数组-BarButtonItems
        navigationItem.rightBarButtonItems = [historyBtnItem, searchBtnItem, qrcodeBtnItem]
        */
        
        
        // 代码重复性高，将UIBarButtonItem进行扩展，直接调用扩展后的函数
        /*
        // 历史按钮
        let historyBtn = UIButton()
        // 给按钮设置两个图片数字，一个是正常情况，一个是高亮图片
        historyBtn.setImage(UIImage(named: "image_my_history"), for: .normal)
        historyBtn.setImage(UIImage(named: "Image_my_history_click"), for: .highlighted)
        
        historyBtn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        // sizeToFit--若显CGSize示的图片挨在一起，则表明图片太小,该用CGSize
        // historyBtn.sizeToFit()
        // customView-自定义按钮属性
        // let historyItem = UIBarButtonItem(customView: historyBtn)
        // 查询按钮
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "btn_search"), for: .normal)
        searchBtn.setImage(UIImage(named: "btn_search_clicked"), for: .highlighted)
        
        searchBtn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        // searchBtn.sizeToFit()
        let searchItem = UIBarButtonItem(customView: searchBtn)
        
        //二维码按钮
        let qrcodeBtn = UIButton()
        qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: .normal)
        qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), for: .highlighted)
        
        qrcodeBtn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        // qrcodeBtn.sizeToFit()
        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
 
        // 右侧三个按钮数组-BarButtonItems
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]     // 设置数组
        */
    }
}
