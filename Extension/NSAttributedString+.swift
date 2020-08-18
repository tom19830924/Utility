//
//  NSAttributedString+.swift
//
//  Created by Tom on 2019/1/17.
//

import Foundation

/*
 將AttributeString加入NSString format功能, 使有attribute功能的元件(例如UILabel), 在storyboard設置好的AttributeString可直接置換
 
 範例: 假設label.attributedText已設置完成format樣式, 文本樣式為 "一共 %d 筆資料"
 其中 "一共" , " %d " , "筆資料" 為已設置好三種不同的attribute樣式
 傳入整個attrubite文本 "一共 %d 筆資料" 與 arguments 內容, 會將 %d 置換為 argument 而不更改其attribute
 
 totalLabel.attributedText = NSAttributedString.init(format: totalLabel.attributedText!, 12)
 */
extension NSAttributedString {
    convenience init(format: NSAttributedString?, _ arguments: CVarArg...) {
        var mutableAttributedString = NSMutableAttributedString.init()
        
        if let format = format {
            // TODO: 此處寫法感覺不是很好, 應該還可以改善, 但我不知道怎改善QQ, 目前可取代 %@, %d, %f
            mutableAttributedString = format.mutableCopy() as! NSMutableAttributedString
            for argument in arguments {
                if argument is String {
                    let arg: String = argument as! String
                    let range: NSRange = mutableAttributedString.rangeOf(string: "%@")
                    mutableAttributedString.replaceCharacters(in: range, with: String(arg))
                }
                else if argument is Int {
                    let arg: Int = argument as! Int
                    let range: NSRange = mutableAttributedString.rangeOf(string: "%d")
                    mutableAttributedString.replaceCharacters(in: range, with: String(arg))
                }
                else if argument is Double {
                    let arg: Double = argument as! Double
                    let range: NSRange = mutableAttributedString.rangeOf(string: "%f")
                    mutableAttributedString.replaceCharacters(in: range, with: String(arg))
                }
            }
        }
        
        self.init(attributedString: mutableAttributedString)
    }
}

extension NSAttributedString {
    func rangeOf(string: String) -> NSRange {
        let nsStr = self.string as NSString
        return nsStr.range(of: string)
    }
}
