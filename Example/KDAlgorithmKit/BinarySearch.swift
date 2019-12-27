//
//  BinarySearch.swift
//  KDAlgorithmKit_Example
//
//  Created by hour on 2019/12/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

// recursive
public func binarySearch<T: Comparable>(_ arr: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound < range.upperBound {
        let minxIndex = (range.lowerBound + range.upperBound) / 2
        
        if arr[minxIndex] > key {
            return binarySearch(arr, key: key, range: range.lowerBound..<minxIndex)
        } else if arr[minxIndex] < key {
            return binarySearch(arr, key: key, range: minxIndex + 1 ..< range.upperBound)
        } else {
            return minxIndex
        }
    }

    return nil
}

// 循环
public func binarySearch<T: Comparable>(_ arr: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = arr.count
    
    while lowerBound < upperBound {
        let minIndex = lowerBound + (upperBound - lowerBound) / 2
        
        if arr[minIndex] > key {
            upperBound = minIndex
        } else if arr[minIndex] < key {
            lowerBound = minIndex
        } else {
            return minIndex
        }
    }
    
    return nil
}
