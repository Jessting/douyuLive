//
//  UIBarButtonItem-Extension.swift
//  douyuLive
//
//  Created by FDC on 2019/5/14.
//  Copyright © 2019 FDC. All rights reserved.
//

// 先倒入UIKit 框架
import UIKit

extension UIBarButtonItem {
    
    // 以下是类方法，其实swift中更多的是用到构造函数方法
    /*
    class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        return UIBarButtonItem(customView: btn)
    }
 */
    
    // 对系统类扩充构造函数
    // 便利构造函数init: 1:convenience 关键字开头；2:在构造函数中必须明确调用一个设计的构造函数（self）3:构造函数没有返回值
    // highImageName: String = "" 是将其设置为默认参数，可传可不传
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize(width: 0, height: 0)) {
        
        // 1、创建 UIButton
        let btn = UIButton()
        
        // 2、设置 btn 的图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3、设置 btn 的尺寸
        if size == CGSize(width: 0, height: 0) {
            btn.sizeToFit()
        }else {
            btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        }
        
        // 4、创建 UIBarButtonItem
        self.init(customView: btn)
        
    }
}
