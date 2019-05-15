//
//  UIColor-Extension.swift
//  douyuLive
//
//  Created by FDC on 2019/5/15.
//  Copyright © 2019 FDC. All rights reserved.
//

// 扩展 UIcolor 的方法
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
