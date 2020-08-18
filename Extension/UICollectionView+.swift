//
//  UICollectionView+.swift
//
//  Created by Tom on 2019/9/4.
//

import UIKit

extension UICollectionView {
    // Cell
    func registerCell(_ cellType: UICollectionViewCell.Type, bundle: Bundle? = nil) {
        if let bundle = bundle {
            if bundle.path(forResource: cellType.className, ofType: "nib") != nil {
                let nib = UINib(nibName: cellType.className, bundle: bundle)
                register(nib, forCellWithReuseIdentifier: cellType.className)
            }
        }
        else if Bundle.main.path(forResource: cellType.className, ofType: "nib") != nil {
            let nib = UINib(nibName: cellType.className, bundle: nil)
            register(nib, forCellWithReuseIdentifier: cellType.className)
        }
        else {
            register(cellType, forCellWithReuseIdentifier: cellType.className)
        }
    }
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    // Header
    func registerSupplementaryView(_ reusableViewType: UICollectionReusableView.Type, ofKind kind: String = UICollectionView.elementKindSectionHeader, bundle: Bundle? = nil) {
        let nib = UINib(nibName: reusableViewType.className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableViewType.className)
    }
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(with type: T.Type, for indexPath: IndexPath, ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
