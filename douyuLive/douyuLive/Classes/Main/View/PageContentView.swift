//
//  PageContentView.swift
//  douyuLive
//
//  Created by FDC on 2019/5/15.
//  Copyright © 2019 FDC. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {
    
    // MASK:-定义属性
    private var childVcs: [UIViewController]
    private var parentViewController: UIViewController
    
    // MASK:-懒加载属性
    private lazy var collectionView: UICollectionView = {
        // 1、创建 layout
        let layout = UICollectionViewFlowLayout()
        // layout 的属性
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        // 2、创建 UICollectionView
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        // collectionView 的属性
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        
        // 显示 collectionView 的内容
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        
        return collectionView
    } ()

    // MASK:-自定义d构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        // 设置 UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MASK:-设置 UI 界面
extension PageContentView {
    
    private func setupUI() {
        
        // 1、将所有的子控制器添加父控制器中
        for childVc in childVcs {
            parentViewController.addChild(childVc)
        }
        
        // 2、添加 UICollectionView，用于在 Cell 中存放控制器的 View
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MASK:-遵守协议 UICollectionViewDataSource
extension PageContentView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 1、创建 cell， (先注册 cell, collectionView.register)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        
        // 2、给 Cell 设置内容
        
        // cell 会循环添加，在添加之前先清楚之前的内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        // 添加新的 cell
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}
