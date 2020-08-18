//
//  Collection+.swift
//
//  Created by Tom on 2020/2/24.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
