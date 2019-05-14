//
//  PageTitleView.swift
//  douyuLive
//
//  Created by FDC on 2019/5/14.
//  Copyright © 2019 FDC. All rights reserved.
//

import UIKit

// 设置滚动条高度-常量（以k开头）
private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {

    // msk:-定义属性
    private var titles: [String]
    
    // MASK:-懒加载一个数组
    private lazy var titleLabels: [UILabel] = [UILabel] ()
    
    // MASK:-懒加载属性(scrollView 在其他地方也会用到)
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false  // 能滚动，但是超不过内容的范围
        
        return scrollView
    }()
    
    //MASK:-懒加载属性(scrollView 在其他地方也会用到)
    private lazy var scrollLine: UIView = {
        
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
        
    }()
    
    // MASK:-自定义构造函数
    init(frame: CGRect, titles: [String]) {
       
        self.titles = titles
        super.init(frame: frame)
        
        // 设置 UI 界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MASK:-设置 UI 界面
extension PageTitleView {
    private func setupUI() {
        
        // 1、添加 UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds   // scrollView 是没有 frame 的，他的 frame 是当前 view 的边界 bound
        
        // 2、添加 title 对应的 label
        setupTitleLabels()
        
        // 3、设置底线和滑动的滑块
        setupBottonMenuAndScrollLine()
        
    }
    
    private func setupTitleLabels() {
        
        // 0.确定 label 的一些 frame 值
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kScrollLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
           
            // 1、创建 UILabel
            let label = UILabel()
            
            // 2、设置 Label 的属性
            label.text = title      // label 的文本名称
            label.tag = index       // label 的标签
            label.font = UIFont.systemFont(ofSize: 16.0)    // label 的字体大小
            label.textColor = UIColor.darkGray              // label 的文字颜色
            label.textAlignment = .center                   // label 文字居中
            
            // 3、设置 label 的 frame
            // let labelW: CGFloat = frame.width / CGFloat(titles.count)
            // let labelH: CGFloat = frame.height - kScrollLineH
            let labelX: CGFloat = labelW * CGFloat(index)
            //  let labelY: CGFloat = 0
           
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 4、将 label 添加到 scrollView 中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    private func setupBottonMenuAndScrollLine() {
        
        // 1、添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2、添加 scrollLine
        // 2.1 获取第一个 label，同时做校验
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
       
        // 2.2 设置scrollLine 的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}
