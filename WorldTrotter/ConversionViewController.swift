//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Luis Eduardo Madina Huerta on 6/16/20.
//  Copyright © 2020 Luis Eduardo Madina Huerta. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("First View Controller")
    }
    
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = getRandomColor()
    }
    
    
    
    
}

