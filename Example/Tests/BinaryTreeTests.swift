//
//  BinaryTreeTests.swift
//  KDAlgorithmKit_Tests
//
//  Created by hour on 2019/12/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import KDAlgorithmKit

class BinaryTreeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // leaf nodes
        
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

        print(tree.description)
//        tree.traverseInOrder { value in
//            print("== \(value)")
//        }
//       tree.traversePreOrder { value in
//           print("== \(value)")
//       }
//       tree.traversePostOrder { value in
//           print("== \(value)")
//       }
        
        
    }

}
