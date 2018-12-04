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
        SortAlgorithm.selectSort(arr: &arr)
        
        testGraph()
        
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    func testGraph() {
        var graph = Graph(v: 8)
        
        graph.addEdge(s: 1, t: 2)
        graph.addEdge(s: 2, t: 3)
        graph.addEdge(s: 4, t: 5)
        graph.addEdge(s: 5, t: 6)
        graph.addEdge(s: 7, t: 8)
        
        graph.addEdge(s: 1, t: 4)
        graph.addEdge(s: 2, t: 5)
        graph.addEdge(s: 3, t: 6)
        
        graph.addEdge(s: 5, t: 7)
        graph.addEdge(s: 6, t: 8)
        
        graph.dfs(s: 0, t: 7)
    }
    
}

extension SortAlgorithm {
    
}
