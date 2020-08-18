//
//  UIVIewController+.swift
//
//  Created by Tom on 2019/4/25.
//

import UIKit

enum StoryboardInstantiateType {
    case initial
    case identifier(String)
}

protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var instantiateType: StoryboardInstantiateType { get }
}

extension StoryboardInstantiatable where Self: NSObject {
    static var storyboardName: String {
        return className
    }
    
    static var storyboardBundle: Bundle {
        return Bundle(for: self)
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
    
    static var instantiateType: StoryboardInstantiateType {
        return .initial
    }
}

extension StoryboardInstantiatable where Self: UIViewController {
    static func initFromStoryboard() -> Self {
        switch instantiateType {
        case .initial:
            return storyboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        }
    }
}

extension UIViewController: StoryboardInstantiatable {}
