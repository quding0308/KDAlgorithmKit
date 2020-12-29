//
//  ViewController.swift
//  KDAlgorithmKit
//
//  Created by quding on 09/27/2018.
//  Copyright (c) 2018 quding. All rights reserved.
//

import UIKit

import KDAlgorithmKit

class ViewController: UIViewController {

//    let sortAlgorithm = SortAlgorithm()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var arr = [2, 3, 4, 1, 5, 2]
//        SortAlgorithm.bubleSort(arr: &arr)
//        SortAlgorithm.insertSort(arr: &arr)
//        SortAlgorithm.selectSort(arr: &arr)
        // d1
        // d2
        // d2-1
        // d2-2
        // d2-3
        // d2-4

        testBinaryTree()
//        testGraph()
        
        print("")
        // m1
        // m2
        // m3
    }

    func testLinkedList() {

    }
    
    // 参考 https://github.com/raywenderlich/swift-algorithm-club/blob/master/Binary%20Tree/README.markdown
    fileprivate func testBinaryTree() {
        let node5 = BinaryTree.node(.empty, "5", .empty)
        let nodeA = BinaryTree.node(.empty, "a", .empty)
        let node10 = BinaryTree.node(.empty, "10", .empty)
        let node4 = BinaryTree.node(.empty, "4", .empty)
        let node3 = BinaryTree.node(.empty, "3", .empty)
        let nodeB = BinaryTree.node(.empty, "b", .empty)

        // intermediate nodes on the left
        let Aminus10 = BinaryTree.node(nodeA, "-", node10)
        let timesLeft = BinaryTree.node(node5, "*", Aminus10)

        // intermediate nodes on the right
        let minus4 = BinaryTree.node(.empty, "-", node4)
        let divide3andB = BinaryTree.node(node3, "/", nodeB)
        let timesRight = BinaryTree.node(minus4, "*", divide3andB)

        // root node
        let tree = BinaryTree.node(timesLeft, "+", timesRight)

//        tree.traverseInOrder { value in
//            print("== \(value)")
//        }
//       tree.traversePreOrder { value in
//           print("== \(value)")
//       }
//       tree.traversePostOrder { value in
//           print("== \(value)")
//       }

//        print(tree.description)
        
        BinaryTreeUtil().traverseBreadthFirst(tree) { value in
            print("== \(value)")
        }
    }
 
    func testGraph() {
//        var graph = Graph(v: 8)
//        
//        graph.addEdge(s: 1, t: 2)
//        graph.addEdge(s: 2, t: 3)
//        graph.addEdge(s: 4, t: 5)
//        graph.addEdge(s: 5, t: 6)
//        graph.addEdge(s: 7, t: 8)
//        
//        graph.addEdge(s: 1, t: 4)
//        graph.addEdge(s: 2, t: 5)
//        graph.addEdge(s: 3, t: 6)
//        
//        graph.addEdge(s: 5, t: 7)
//        graph.addEdge(s: 6, t: 8)
//        
//        print("bfs 最短路径")
//        graph.bfs(s: 0, t: 7)
//        
//        print("dfs")
//        graph.dfs(s: 0, t: 7)
    }
}

extension SortAlgorithm {
    
}
