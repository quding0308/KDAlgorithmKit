//
//  AdjacencyMatrixGraph.swift
//  KDAlgorithmKit
//
//  Created by hour on 2019/12/31.
//

import Foundation

// adjacency 领接，相邻
// vertices vertex 的复数
public class AdjacencyMatrixGraph<T>: AbstractGraph<T> where T: Hashable {
    
    fileprivate var adjacencyMatrix: [[Double?]] = []
    fileprivate var _vertices: [Vertex<T>] = []
    
    public required init() {
        super.init()
    }
    
    public required init(fromGraph graph: AbstractGraph<T>) {
        super.init(fromGraph: graph)
    }
    
    public override var vertices: [Vertex<T>] {
        return _vertices
    }
    
    public override var edges: [Edge<T>] {
        var edges = [Edge<T>]()
        
        for row in 0 ..< adjacencyMatrix.count {
            for column in 0 ..< adjacencyMatrix[row].count {
                if let weight = adjacencyMatrix[row][column] {
                    edges.append(Edge(from: vertices[row], to: vertices[column], weight: weight))
                }
            }
        }
        
        return edges
    }
    
    public override func createVertex(_ data: T) -> Vertex<T> {
        let matchingVertices = vertices.filter { vertex -> Bool in
            return vertex.data == data
        }
        
        if matchingVertices.count > 0 {
            return matchingVertices.last!
        }
        
        let vertex = Vertex(data: data, index: adjacencyMatrix.count)
        
        // add each existing row to the right ont column
        for i in 0 ..< adjacencyMatrix.count {
            adjacencyMatrix[i].append(nil)
        }
        
        // add one new row at the bottom
        let newRow = [Double?](repeating: nil, count: adjacencyMatrix.count + 1)
        adjacencyMatrix.append(newRow)
        
        _vertices.append(vertex)
        
        return vertex
    }
    
    open override func addDirectedEdge(_ from: Vertex<T>, to: Vertex<T>, withWeight weight: Double?) {
        adjacencyMatrix[from.index][to.index] = weight
    }

    open override func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), withWeight weight: Double?) {
        addDirectedEdge(vertices.0, to: vertices.1, withWeight: weight)
        addDirectedEdge(vertices.1, to: vertices.0, withWeight: weight)
    }

    open override func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
        return adjacencyMatrix[sourceVertex.index][destinationVertex.index]
    }

    open override func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
        var edges = [Edge<T>]()
        
        for column in 0 ..< adjacencyMatrix.count {
            if let weight = adjacencyMatrix[sourceVertex.index][column] {
                edges.append(Edge(from: sourceVertex, to: vertices[column], weight: weight))
            }
        }
        
        return edges
    }

    open override var description: String {
      var grid = [String]()
      let n = self.adjacencyMatrix.count
      for i in 0..<n {
        var row = ""
        for j in 0..<n {
          if let value = self.adjacencyMatrix[i][j] {
            let number = NSString(format: "%.1f", value)
            row += "\(value >= 0 ? " " : "")\(number) "
          } else {
            row += "  ø  "
          }
        }
        grid.append(row)
      }
      return (grid as NSArray).componentsJoined(by: "\n")
    }
}
