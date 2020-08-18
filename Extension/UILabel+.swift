//
//  UILabel+.swift
//
//  Created by Tom on 2019/5/8.
//

import UIKit

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font as Any], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    
    func setSigndNumberTextWithColor(_ text: String?,
                                     positiveColor: UIColor = .up,
                                     negitiveColor: UIColor = .down,
                                     zeroColor: UIColor = .flat) {
        self.text = text
        
        if
            let trimText = text?.replacingOccurrences(of: "%", with: ""),
            let number = Double(trimText) {
                if number > 0 {
                    self.textColor = positiveColor
                }
                else if number < 0 {
                    self.textColor = negitiveColor
                }
                else {
                    self.textColor = zeroColor
                }
        }
        else {
            self.textColor = zeroColor
        }
    }
}
