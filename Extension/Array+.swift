//
//  Array+.swift
//
//  Created by Tom on 2019/11/11.
//

import Foundation

extension Array where Element: Hashable {
    func next(item: Element) -> Element? {
        if let index = self.firstIndex(of: item) {
            if index + 1 < self.count {
                return self[index + 1]
            }
        }
        return nil
    }
    func previous(item: Element) -> Element? {
        if let index = self.firstIndex(of: item) {
            if index - 1 > 0 {
                return self[index - 1]
            }
        }
        return nil
    }
}

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}
