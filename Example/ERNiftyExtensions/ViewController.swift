//
//  ViewController.swift
//  ERNiftyExtensions
//
//  Created by erusso1 on 06/05/2017.
//  Copyright (c) 2017 erusso1. All rights reserved.
//

import UIKit
import ERNiftyExtensions

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        view.backgroundColor = .blue
        view.cornerRadius = 12
        
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class ExampleViewController: UIViewController {
  
  
}
