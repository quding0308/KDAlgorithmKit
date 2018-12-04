//
//  main1.swift
//  SwiftCommand
//
//  Created by hour on 2018/12/4.
//  Copyright © 2018 hour. All rights reserved.
//

import Foundation

public struct Graph {
    private var v: Int  // 顶点个数
    private var adj: [LinkedList<Int>]
    
    public init(v: Int) {
        self.v = v
        
        adj = [LinkedList<Int>]()
        for _ in 0..<v {
            adj.append(LinkedList<Int>())
        }
    }
    
    public func addEdge(s: Int, t: Int) {   // 无向图 两个链表都增加
        adj[s-1].add(element: t-1)
        adj[t-1].add(element: s-1)
    }
    
    private func printPath(prev: [Int], s: Int, t: Int) {
        if (prev[t] != -1 && t != s) {
            printPath(prev: prev, s: s, t: prev[t])
        }
        
        print("\(t+1)  ")
    }
}

extension Graph {
    mutating public func dfs(s: Int, t: Int) {
        var isFound = false
        var visited = [Bool](repeating: false, count: v)
        var prev = [Int](repeating: -1, count: v)
        
        func recursiveDFS(w: Int, t: Int, visited: inout [Bool], prev: inout [Int]) {
            if isFound {
                return
            }
            
            visited[w] = true
            if w == t {
                isFound = true
                return
            }
            
            // 遍历相邻的node
            for index in 0..<adj[w].count {
                if let node = adj[w].query(index: index), let value = node.value {
                    if !visited[value] {
                        prev[value] = w
                        recursiveDFS(w: value, t: t, visited: &visited, prev: &prev)
                    }
                }
            }
        }
        
        recursiveDFS(w: s, t: t, visited: &visited, prev: &prev)
        printPath(prev: prev, s: s, t: t)
    }
}