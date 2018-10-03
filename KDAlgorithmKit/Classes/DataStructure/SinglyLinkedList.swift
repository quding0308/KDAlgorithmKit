//
//  SinglyLinkedList.swift
//  KDAlgorithmKit
//
//  Created by hour on 2018/9/30.
//

import Foundation

/**
 顺序表 是在计算机内存中以数组的形式保存的线性表，是指用一组地址连续的存储单元依次存储数据元素的线性结构。
 
 顺序表的复杂度
     随机插入、删除 O(n)
     访问随机元素 O(1)
 
 链表 是一种线性表。
 但是并不会按线性的顺序存储数据，而是每一个节点存储下一个节点的指针。
 
 链表的复杂度
     随机插入、删除 O(1)
     访问随机元素 O(n)
 
 链表分为：
    单向链表
    双向链表
    循环链表
    块状链表
 
 */
class SinglyLinkedList<Element> {
    
    typealias Node = SignlyLinkedListNode<Element>
    
    public var head: Node?
    
    func append(_ newNode: Node) {
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
        
        while let next = node?.next, i <= index {
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

class SignlyLinkedListNode<Element> {
    typealias Node = SignlyLinkedListNode<Element>

    var value: Element?
    var next: Node?
}

extension SinglyLinkedList {
    func hasCircle() -> Bool {
        var slowStep = head
        var quickStep = head?.next
        
        while let quick = quickStep, let slow = slowStep  {
            if quick === slow {
                return true
            } else {
                quickStep = quickStep?.next?.next
                slowStep = slowStep?.next
            }
        }
        
        return false
    }
    
    func detectCycle() -> Node? {
        var slowStep = head
        var quickStep = head?.next
        
        var cross: Node? = nil
        while let quick = quickStep, let slow = slowStep  {
            if quick === slow {
                cross = quick
            } else {
                quickStep = quickStep?.next?.next
                slowStep = slowStep?.next
            }
        }
        
        var headWalker = head
        var crossWalker = cross
        while let _ = headWalker?.next, let _ = crossWalker?.next, headWalker !== crossWalker {
            crossWalker = crossWalker?.next
            headWalker = headWalker?.next
        }
        
        if headWalker === crossWalker {
            return headWalker
        }
        
        return nil
    }
}
