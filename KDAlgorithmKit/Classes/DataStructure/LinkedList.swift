//
//  LinkedList.swift
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
class LinkedList {
    
    public var head: LinkedListNode?
    
    func append(node: LinkedListNode) {
        
    }
    
    func delete(node: LinkedListNode) {
        
    }
    
    func deleteAt(index: Int) {
        
    }
    
    func query(index: Int) -> LinkedListNode? {
     
        return nil
    }
    
    func hasNode(node: LinkedListNode) -> Bool {
        
        return false
    }
    
    
}

class LinkedListNode {
    
    var value: AnyObject?
    var next: LinkedListNode?
    
}

extension LinkedList {
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
}
