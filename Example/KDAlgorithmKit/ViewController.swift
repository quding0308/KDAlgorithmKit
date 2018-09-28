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
        
        
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SortAlgorithm {
    
}
