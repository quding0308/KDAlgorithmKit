//
//  LRU.swift
//  KDAlgorithmKit
//
//  Created by hour on 2018/10/3.
//

import Foundation

/// TODO:
/// 线程安全处理

/// LRU算法
public class LRU<Element> {
    public typealias Node = LRUNode<Element>

    /// count limit 大于0才生效
    public var countLimit: UInt = 0
    
    /// age limit 过期时间
//    public var ageLimit: TimeInterval
    
    private var dict = [String: Node]()
    private var head: Node?
    private var tail: Node?
    
    private func insertNodeAtHead(_ node: Node) {
        if let _ = head {
            node.next = head
            head?.pre = node
            
            head = node
        } else {
            head = node
            tail = node
        }
    }
    
    private func bringNodeToHead(_ node: Node) {
        guard node !== head else {
            return
        }
        
        if tail === node {
            tail = node.pre
            tail?.next = nil
        } else {
            node.pre?.next = node.next
            node.next?.pre = node.pre
        }
        
        node.next = head
        node.pre = nil
        head?.pre = node
        head = node
    }
    
    private func removeNode(_ node: Node) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }
    
    private func removeTailNode() {
        tail = tail?.pre
        tail?.pre = nil
    }
    
    // MARK: public
    public func set(_ key: String, element: Element) {
        let node = LRUNode(key: key, element: element)
        node.time = NSTimeIntervalSince1970
        
        dict[node.key] = node
        insertNodeAtHead(node)
        
        if dict.count > countLimit {
            removeTailNode()
        }
    }
    
    public func element(key: String) -> Element? {
        if let node = dict[key] {
            bringNodeToHead(node)
            return node.element
        }
        
        return nil
    }
    
    public func remove(key: String) {
        if let node = dict[key] {
            removeNode(node)
            
            dict.removeValue(forKey: node.key)
        }
    }
}

public class LRUNode<Element> {
    typealias Node = LRUNode<Element>
    
    var key: String
    var element: Element?
    
    var pre: Node?
    var next: Node?
    
    var time: TimeInterval = TimeInterval()
    
    init(key: String, element: Element?) {
        self.key = key
        self.element = element
    }
}

