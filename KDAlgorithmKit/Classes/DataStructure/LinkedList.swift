//
//  LinkedList.swift
//  KDAlgorithmKit
//
//  Created by hour on 2018/12/3.
//

import Foundation

class LinkedList<Element> {
    
    typealias Node = LinkedListNode<Element>
    
    public var head: Node?
    public var count: Int = 0
    
    func add(element: Element?) {
        let node = LinkedListNode<Element>()
        node.value = element
        
        append(node)
    }
    
    func append(_ newNode: Node) {
        count += 1
        
        guard let _ = head else {
            head = newNode
            return
        }
        
        var node = head
        while let next = node?.next {
            node = next
        }
        
        node?.next = newNode
    }
    
    func delete(_ deletedNode: Node) {
        if head === deletedNode {
            head = head?.next
        }
        
        var node = head
        while let next = node?.next {
            if next === deletedNode {
                node?.next = next.next
                break
            }
            
            count -= 1
            node = next
        }
    }
    
    func deleteAt(_ index: Int) {
        var i = 0
        var node = head
        
        while let next = node?.next, i <= index {
            node = next
            i += 1
        }
        
        if i == index, let node = node {
            delete(node)
        }
    }
    
    func query(index: Int) -> Node? {
        var i = 0
        var node = head
        
        while let next = node?.next, i < index {
            node = next
            i += 1
        }
        
        if i == index {
            return node
        }
        
        return nil
    }
    
    func hasNode(_ searchNode: Node) -> Bool {
        if head === searchNode {
            return true
        }
        
        var node = head
        while let next = node?.next {
            if next === searchNode {
                return true
            }
            
            node = next
        }
        
        return false
    }
}

class LinkedListNode<Element> {
    typealias Node = LinkedListNode<Element>
    
    var value: Element?
    var next: Node?
}

