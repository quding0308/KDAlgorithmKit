//
//  BinaryHeap.swift
//  KDTool
//
//  Created by hour on 2018/8/7.
//

public struct BinaryHeap<T> {
    
    /** The array that stores the heap's nodes. */
    var nodes = [T]()
    
    private var orderCriteria: (T, T) -> Bool
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    public mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
          shiftDown(i)
        }
    }
    
    internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }
    
    internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
    
        remove(at: i)
        insert(value)
    }
    
    /**
      * Removes the root node from the heap. For a max-heap, this is the maximum
      * value; for a min-heap it is the minimum value. Performance: O(log n).
      */
     @discardableResult public mutating func remove() -> T? {
       guard !nodes.isEmpty else { return nil }
       
       if nodes.count == 1 {
         return nodes.removeLast()
       } else {
         // Use the last node to replace the first one, then fix the heap by
         // shifting this new first node into its proper position.
         let value = nodes[0]
         nodes[0] = nodes.removeLast()
         shiftDown(0)
         return value
       }
     }
     
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        
        return nodes.removeLast()
    }
    
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }

    internal mutating func shiftDown(_ index: Int) {
      shiftDown(from: index, until: nodes.count)
    }
    
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = self.rightChildIndex(ofIndex: index)
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
}
