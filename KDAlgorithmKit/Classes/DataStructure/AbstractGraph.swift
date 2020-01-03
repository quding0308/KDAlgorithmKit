//
//  main1.swift
//  SwiftCommand
//
//  Created by hour on 2018/12/4.
//  Copyright © 2018 hour. All rights reserved.
//

import Foundation

public struct Vertex<T>: Equatable where T: Hashable {
    public var data: T
    public let index: Int
    
    // 遍历使用
    var isVisited = false
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)\(index)".hashValue
    }
}

public func == <T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.index == rhs.index else {
        return false
    }
    
    guard lhs.data == rhs.data else {
        return false
    }
    
    return true
}

public struct Edge<T>: Equatable where T: Hashable {
    public let from: Vertex<T>
    public let to: Vertex<T>
    
    public let weight: Double?
}

extension Edge: CustomStringConvertible {
  public var description: String {
    guard let unwrappedWeight = weight else {
      return "\(from.description) -> \(to.description)"
    }
    return "\(from.description) -(\(unwrappedWeight))-> \(to.description)"
  }
}

extension Edge: Hashable {
  public var hashValue: Int {
    var string = "\(from.description)\(to.description)"
    if weight != nil {
      string.append("\(weight!)")
    }
    return string.hashValue
  }
}

public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
  guard lhs.from == rhs.from else {
    return false
  }

  guard lhs.to == rhs.to else {
    return false
  }

  guard lhs.weight == rhs.weight else {
    return false
  }

  return true
}

public class AbstractGraph<T>: CustomStringConvertible where T: Hashable {
    
    public required init() {}    

    public required init(fromGraph graph: AbstractGraph<T>) {
      for edge in graph.edges {
        let from = createVertex(edge.from.data)
        let to = createVertex(edge.to.data)

        addDirectedEdge(from, to: to, withWeight: edge.weight)
      }
    }

    open var description: String {
      fatalError("abstract property accessed")
    }

    open var vertices: [Vertex<T>] {
      fatalError("abstract property accessed")
    }

    open var edges: [Edge<T>] {
      fatalError("abstract property accessed")
    }

    // Adds a new vertex to the matrix.
    // Performance: possibly O(n^2) because of the resizing of the matrix.
    open func createVertex(_ data: T) -> Vertex<T> {
      fatalError("abstract function called")
    }

    open func addDirectedEdge(_ from: Vertex<T>, to: Vertex<T>, withWeight weight: Double?) {
      fatalError("abstract function called")
    }

    open func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), withWeight weight: Double?) {
      fatalError("abstract function called")
    }

    open func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
      fatalError("abstract function called")
    }

    open func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
      fatalError("abstract function called")
    }
}

extension AbstractGraph {
    public func traverseDepthFirst(process: (T) -> Void) {
        traverseDepthFirst(vertices[0], process: process)
    }
    
    public func traverseDepthFirst(_ vertex: Vertex<T>, process: (T) -> Void) {
        if vertex.isVisited {
            return
        }
        
        let edges = edgesFrom(vertex)
        for edge in edges {
            traverseDepthFirst(edge.to, process: process)
        }
        
//        vertex.isVisited = true
        process(vertex.data)
    }
    
//    public func traverseBreadthFirst(process: (T) -> Void) {
//        traverseBreadthFirst(vertices[0], process: process)
//    }
    
//    public func traverseBreadthFirst(_ vertex: Vertex<T>, process: (T) -> Void) {
//        if vertex.isVisited {
//            return
//        }
//
//        process(vertex.data)
////        vertex.isVisited = true
//
//        let edges = edgesFrom(vertex)
//        for edge in edges {
//            queue.enqueue(edge.to)
//        }
//
//        if let v = queue.dequeue() {
//            traverseBreadthFirst(v, process: process)
//        }
//    }
}
