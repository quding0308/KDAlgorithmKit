////
////  main1.swift
////  SwiftCommand
////
////  Created by hour on 2018/12/4.
////  Copyright © 2018 hour. All rights reserved.
////
//
//import Foundation
//
//public struct Graph {
//    private var v: Int  // 顶点个数
//    private var adj: [LinkedList<Int>]
//    
//    public init(v: Int) {
//        self.v = v
//        
//        adj = [LinkedList<Int>]()
//        for _ in 0..<v {
//            adj.append(LinkedList<Int>())
//        }
//    }
//    
//    public func addEdge(s: Int, t: Int) {   // 无向图 两个链表都增加
//        adj[s-1].add(t-1)
//        adj[t-1].add(s-1)
//    }
//    
//    private func printPath(prev: [Int], s: Int, t: Int) {
//        if (prev[t] != -1 && t != s) {
//            printPath(prev: prev, s: s, t: prev[t])
//        }
//        
//        print("\(t+1)  ")
//    }
//}
//
//extension Graph {
//    mutating public func bfs(s: Int, t: Int) {
//        // 用于记录某个顶点是否访问过
//        var visited = [Bool](repeating: false, count: v)
//        // 用于输出走过路径  值 存储上一个顶点的坐标
//        var prev = [Int](repeating: -1, count: v)
//        // 待遍历的顶点  queue 先入先出的特性 会优先 遍历最近的顶点
//        var queue = Queue<Int>()
//        
//        queue.enqueue(s)
//        while queue.count > 0 {
//            if let w = queue.dequeue() {
//                for index in 0..<adj[w].count { // 遍历相邻的node
//                    if let node = adj[w].query(index: index) {
//                        if !visited[node.value] {
//                            prev[node.value] = w
//                            if node.value == t {
//                                printPath(prev: prev, s: s, t: t)
//                            }
//                            
//                            visited[node.value] = true
//                            queue.enqueue(node.value)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//extension Graph {
//    mutating public func dfs(s: Int, t: Int) {
//        var isFound = false
//        var visited = [Bool](repeating: false, count: v)
//        var prev = [Int](repeating: -1, count: v)
//        
//        func recursiveDFS(w: Int, t: Int, visited: inout [Bool], prev: inout [Int]) {
//            if isFound {
//                return
//            }
//            
//            visited[w] = true
//            if w == t {
//                isFound = true
//                return
//            }
//            
//            // 遍历相邻的node
//            for index in 0..<adj[w].count {
//                if let node = adj[w].query(index: index) {
//                    if !visited[node.value] {
//                        prev[node.value] = w
//                        recursiveDFS(w: node.value, t: t, visited: &visited, prev: &prev)
//                    }
//                }
//            }
//        }
//        
//        recursiveDFS(w: s, t: t, visited: &visited, prev: &prev)
//        printPath(prev: prev, s: s, t: t)
//    }
//}
