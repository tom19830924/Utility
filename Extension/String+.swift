//
//  String+.swift
//
//  Created by Tom on 2019/4/29.
//

import Foundation
import CommonCrypto

extension String {
    func MD5() -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        
        if let d = self.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { body in
                CC_MD5(body.baseAddress, CC_LONG(d.count), &digest)
            }
        }
        
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
    
    func regex(pattern: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return [String]()
        }

        //        do {
        //            let regex = try NSRegularExpression(pattern: pattern)
        //            let nsstr = self as NSString
        //            let all = NSRange(location: 0, length: nsstr.length)
        //            var matches : [String] = [String]()
        //            regex.enumerateMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: all) {
        //                (result : NSTextCheckingResult?, _, _) in
        //                if let r = result {
        //                    let result = nsstr.substring(with: r.range) as String
        //                    matches.append(result)
        //                }
        //            }
        //            return matches
        //        } catch {
        //            return [String]()
        //        }
    }
    
    /*
     仿造Objective-C NSStringFromClass
     範例: String.fromClass(YourClass.self)
     */
    static func fromClass(_ typeObj: AnyObject.Type) -> String {
        return self.init(String.init(describing: typeObj))
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
    
    func big5Data() -> Data? {
        let rawValue = CFStringEncodings.big5.rawValue
        let encoding = CFStringEncoding(rawValue)
        let big5Encoding = CFStringConvertEncodingToNSStringEncoding(encoding)
        let big5Data = self.data(using: String.Encoding(rawValue: big5Encoding))
        return big5Data
    }
    
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func toInt() -> Int? {
        return Int(self)
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
}
