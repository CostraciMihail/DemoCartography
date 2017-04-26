//
//  ViewController.swift
//  DemoCartography
//
//  Created by winify on 4/25/17.
//  Copyright © 2017 misa.organization. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
        
    }

    
    func methodOne() {
        
        let view1 = UIView(frame: CGRect.zero)
        view1.backgroundColor = UIColor.red
        self.view.addSubview(view1)
        
        let view2 = UIView(frame: CGRect.zero)
        view2.backgroundColor = UIColor.red
        self.view.addSubview(view2)
        
        if let mainView = self.view {
            
            constrain(mainView, view1) { (mainView, view1) in
                
                view1.height == 40
                view1.width == 200
                
                view1.leadingMargin == view1.superview!.leadingMargin + 30
                view1.topMargin == view1.superview!.topMargin + 50
                
            }
            
            
            
        }
    }
    
}
