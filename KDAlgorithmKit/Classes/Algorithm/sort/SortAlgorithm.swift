//
//  SortAlgorithm.swift
//  KDAlgorithmKit
//
//  Created by hour on 2018/9/27.
//

import Foundation

public class SortAlgorithm: NSObject {
    
    /**
     冒泡排序
    
     最优复杂度O(n)
     最差复杂度O(n^2)
     平均复杂度O(n^2)
     稳定
     */
    public static func bubleSort(arr: inout [Int]) {
        for i in 0..<arr.count - 1 {
            for j in 0..<arr.count - 1 - i {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                }
            }
        }
    }
    
    /**
     选择排序
     
     最优复杂度O(n)
     最差复杂度O(n^2)
     平均复杂度O(n^2)
     稳定
     */
    public static func selectSort(arr: inout [Int]) {
        for i in 0..<arr.count {
            var tmp = i
            for j in (i + 1)..<arr.count {
                if arr[tmp] > arr[j] {
                    tmp = j
                }
            }
            
            if tmp != i {
                arr.swapAt(i, tmp)
            }
        }
    }
    
    /**
     插入排序
     
     最优复杂度O(n)
     最差复杂度O(n^2)
     平均复杂度O(n^2)
     稳定
     */
    public static func insertSort(arr: inout [Int]) {
        for i in 1..<arr.count {
            for j in (0..<i).reversed() {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                }
            }
        }
    }
    
    public static func insert2Sort(arr: inout [Int]) {
        for i in 1..<arr.count {
            for j in (0..<i).reversed() {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                } else {
                    break   // 优化点
                }
            }
        }
    }
    
    /**
     归并排序 Merge Sort
     
     最优复杂度O(n*log(n))
     最差复杂度O(n*log(n))
     平均复杂度O(n*log(n))
     
     */
    /// 自顶向下
    public static func mergeSortFromTop(arr: inout [Int], lo: Int, hi: Int) {
        if hi <= lo {
            return
        }
        
        let mid: Int = lo + (hi - lo) / 2
        
        mergeSortFromTop(arr: &arr, lo: lo, hi: mid)
        mergeSortFromTop(arr: &arr, lo: mid + 1, hi: hi)
        merge(arr: &arr, lo: lo, mid: mid, hi: hi)
    }
    
    /// 自底向上
    public static func mergeSortFromBottom(arr: inout [Int], lo: Int, hi: Int) {
        let n = arr.count
        
        for sz in 1..<n { // sz是子数组的元素个数
            for lo in stride(from: 0, to: n - sz, by: sz * 2) { // sz 是子数组索引
                merge(arr: &arr, lo: lo, mid: lo + sz - 1, hi: min(lo + sz + sz - 1, n - 1))
            }
        }
    }
    
    /**
     快速排序 quick Sort
     
     最优复杂度O()
     最差复杂度O()
     平均复杂度O()
     
     */
    public static func quickSort(arr: inout [Int], lo: Int, hi: Int) {
        if lo >= hi {
            return
        }
        
        let j = partition(arr: &arr, lo: lo, hi: hi)
        quickSort(arr: &arr, lo: lo, hi: j - 1)
        quickSort(arr: &arr, lo: j + 1, hi: hi)
    }

    public static func heapSort(arr: inout [Int], lo: Int, hi: Int) {
        // 把乱序数组建成二叉堆  (parent > childLeft, parent > childRight)
        for index in (0..<(arr.count-2)/2).reversed() {
            heapDown(arr: &arr, parentIndex: index, length: arr.count)
        }
        
        
        
        
    }
}

extension SortAlgorithm {
    
    /// 下层操作 最大堆
    ///
    /// - Parameters:
    ///   - arr:
    ///   - parentIndex:
    fileprivate static func heapDown(arr: inout [Int], parentIndex: Int, length: Int) {
        
        
    
    
    }
}

extension SortAlgorithm {
    /*
     lo low
     mid middle
     hi high
     */
    fileprivate static func merge(arr: inout [Int], lo: Int, mid: Int, hi: Int) {
        var i = lo
        var j = mid + 1
        
        var tmpArr = [Int]()
        for value in arr {
            tmpArr.append(value)
        }
        
        for index in 0..<arr.count {
            if i > mid {
                arr[index] = tmpArr[j]
                j += 1
            } else if j > hi {
                arr[index] = tmpArr[i]
                i += 1
            } else if tmpArr[i] < tmpArr[j] {
                arr[index] = tmpArr[i]
                i += 1
            } else {
                arr[index] = tmpArr[j]
                j += 1
            }
        }
    }
}

extension SortAlgorithm {
    
    /// 快速排序的切分 找到切分点j 此时 j位置的元素 已经排好，不需要处理
    fileprivate static func partition(arr: inout [Int], lo: Int, hi: Int) -> Int {
        var i = lo + 1
        var j = hi + 1
        
        let v = arr[lo] // 切分的元素
        
        while true {
            while arr[i] < v {
                i += 1
                
                if i == hi {
                    break
                }
            }
            
            while arr[j] > v {
                j -= 1
                
                if j == lo {
                    break
                }
            }
            
            if i >= j {
                break
            }
            
            arr.swapAt(i, j)
        }
        
        arr.swapAt(lo, j)
        
        return j
    }
}
