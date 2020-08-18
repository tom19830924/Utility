//
//  UITableView+.swift
//
//  Created by Tom on 2019/9/4.
//

import UIKit

extension UITableView {
    // Cell
    func registerCell(_ cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
        if let bundle = bundle {
            if bundle.path(forResource: cellType.className, ofType: "nib") != nil {
                let nib = UINib(nibName: cellType.className, bundle: bundle)
                register(nib, forCellReuseIdentifier: cellType.className)
            }
        }
        else if Bundle.main.path(forResource: cellType.className, ofType: "nib") != nil {
            let nib = UINib(nibName: cellType.className, bundle: nil)
            register(nib, forCellReuseIdentifier: cellType.className)
        }
        else {
            register(cellType, forCellReuseIdentifier: cellType.className)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    // Header
    func registerHeaderFooterView(_ cellType: UITableViewHeaderFooterView.Type, bundle: Bundle? = nil) {
        if let bundle = bundle {
            if bundle.path(forResource: cellType.className, ofType: "nib") != nil {
                let nib = UINib(nibName: cellType.className, bundle: bundle)
                register(nib, forHeaderFooterViewReuseIdentifier: cellType.className)
                
            }
        }
        else if Bundle.main.path(forResource: cellType.className, ofType: "nib") != nil {
            let nib = UINib(nibName: cellType.className, bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: cellType.className)
            
        }
        else {
            register(cellType, forHeaderFooterViewReuseIdentifier: cellType.className)
        }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
}
