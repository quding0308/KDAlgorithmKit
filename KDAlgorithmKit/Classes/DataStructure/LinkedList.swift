//
//  LinkedList.swift
//  KDAlgorithmKit
//
//  Created by hour on 2018/12/3.
//

import Foundation

public final class LinkedList<T> {
    
    public class LinkedListNode<T> {
        public var value: T
        public var next: LinkedListNode<T>?
        public weak var previous : LinkedListNode<T>?
        
        public init(_ value: T) {
            self.value = value
        }
    }

    public typealias Node = LinkedListNode<T>
    
    public var head: Node?
    
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public init() {}
    
    public subscript(index: Int) -> T {
        let node = self.node(at: index)
        
        return node.value
    }
    
    public func node(at index: Int) -> Node {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater than 0")
        
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if (node == nil) {
                    break
                }
            }
            
            assert(node != nil, "index is out of bounds.")
            return node!
        }
    }
    
    public func append(_ value: T) {
        let node = Node(value)
        append(node)
    }
    
    public func append(_ node: Node) {
        let newNode = node
        newNode.next = nil
        
        if let lastNode = last {
            lastNode.next = newNode
            newNode.previous = lastNode
        } else {
            head = newNode
        }
    }
    
    public func append(_ list: LinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            append(node.value) // a new node
            nodeToCopy = node.next
        }
    }
    
    public func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = node(at: index - 1)
            let next = node(at: index)
            
            newNode.previous = prev
            newNode.next = next
            prev.next = newNode
            next.previous = prev
        }
    }
    
    public func insert(_ list: LinkedList, at index: Int) {
        if list.isEmpty { return }
        
        if index == 0 {
            let tmp = list.last?.next
            tmp?.next = head
            head?.previous = tmp
            
            head = list.head
        } else {
            let prev = node(at: index - 1)
            let next = node(at: index)
            
            prev.next = list.head
            list.head?.previous = prev
            
            list.last?.next = next
            next.previous = list.last
        }
    }
    
    public func removeAll() {
        head = nil
    }
    
    @discardableResult public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        prev?.next = next
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    @discardableResult public func removeLast() -> T {
        assert(!isEmpty, "list is empty")
        return remove(node: last!)
    }
    
    @discardableResult public func remove(at index: Int) -> T {
        let node = self.node(at: index)
        return remove(node: node)
    }
}

extension LinkedList {
    public func reverse() {
        var node = head
        
        while let currNode = node {
            node = currNode.next
            swap(next: &currNode.previous, prev: &currNode.next)
            head = currNode
        }
    }
    
    private func swap(next: inout Node?, prev: inout Node?) {
        let tmp = next
        next = prev
        prev = tmp
    }
}
