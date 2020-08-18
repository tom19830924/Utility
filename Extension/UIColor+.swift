//
//  UIColor+.swift
//
//  Created by Tom on 2019/1/17.
//

import UIKit

extension UIColor {
    /*
     使UIColor能處理HEX字串, 前綴#有無帶入皆可
     範例: UIColor.init(hexString: "#0C5D89") , UIColor.init(hexString: "0C5D89")
     */
    convenience init(hexString: String, alpha:CGFloat? = 1.0) {
        var hexInt: UInt64 = 0
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt64(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /*
     隨機產生顏色
     */
    static func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    // 通用顏色設定 (如果未來新增顏色, 請在Color.xcasets也一併增加, 方便在xib可以使用)
    
    
    /// 上漲
    class var up: UIColor {
        return UIColor(hexString: "#FF3B30")
    }
    
    /// 下跌
    class var down: UIColor {
        return UIColor(hexString: "#00C879")
    }
    
    /// 平盤
    class var flat: UIColor {
        return UIColor(hexString: "#FFB600")
    }
}
