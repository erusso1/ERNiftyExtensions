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
        //loadCAGradient()
        loadCorners()
        //test()
    }
    
    fileprivate func loadCAGradient() {
        
        let v = UIView()
        v.frame.size = CGSize(width: 200, height: 200)
        v.center.x = UIScreen.main.bounds.size.width/2
        v.center.y = UIScreen.main.bounds.size.height/2
        
        v.gradient = CAGradientLayer.from(colors: [.red, .green, .blue])
        
        self.view.addSubview(v)
    }
    
    fileprivate func loadCorners() {
        
        let v = UIView()
        v.frame.size = CGSize(width: 200, height: 200)
        v.center.x = UIScreen.main.bounds.size.width/2
        v.center.y = UIScreen.main.bounds.size.height/2
        v.backgroundColor = .green

        v.roundCorners(corners: [.topRight, .bottomRight], radius: 4)
        
        self.view.addSubview(v)
    }
  

    fileprivate func test() {
        
        guard let s: ExampleViewController = UIStoryboard.named("Main").instantiated() else {return}
        
        print(s)
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class ExampleViewController: UIViewController {
  
  
}
