//
//  GraphTest.swift
//  KDAlgorithmKit_Example
//
//  Created by hour on 2019/12/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import KDAlgorithmKit

class GraphTest {

    func test() {
        let graph = AdjacencyMatrixGraph<Int>()
        let v1 = graph.createVertex(1)
        let v2 = graph.createVertex(2)
        let v3 = graph.createVertex(3)
        let v4 = graph.createVertex(4)
        let v5 = graph.createVertex(5)

        graph.addDirectedEdge(v1, to: v2, withWeight: 1.0)
        graph.addDirectedEdge(v2, to: v3, withWeight: 1.0)
        graph.addDirectedEdge(v3, to: v4, withWeight: 4.5)
        graph.addDirectedEdge(v4, to: v1, withWeight: 2.8)
        graph.addDirectedEdge(v2, to: v5, withWeight: 3.2)
    }

    func testList() {
        let graph = AdjacencyListGraph<Int>()

        let v1 = graph.createVertex(1)
        let v2 = graph.createVertex(2)
        let v3 = graph.createVertex(3)
        let v4 = graph.createVertex(4)
        let v5 = graph.createVertex(5)

        graph.addDirectedEdge(v1, to: v2, withWeight: 1.0)
        graph.addDirectedEdge(v2, to: v3, withWeight: 1.0)
        graph.addDirectedEdge(v3, to: v4, withWeight: 4.5)
        graph.addDirectedEdge(v4, to: v1, withWeight: 2.8)
        graph.addDirectedEdge(v2, to: v5, withWeight: 3.2)
    }
}
