//
//  PrototypeViewController.swift
//  DemoCartography
//
//  Created by winify on 4/27/17.
//  Copyright © 2017 misa.organization. All rights reserved.
//

import UIKit

class PrototypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //DRAW CIRCLE
        let circleView = UIView(frame: CGRect(x: 10, y: 50, width: 200, height: 200))
        circleView.backgroundColor = UIColor.darkGray
        circleView.alpha = 0.7
        self.view.addSubview(circleView)
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 50, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.fillColor = UIColor.green.cgColor
        circleLayer.lineWidth = 3
        circleLayer.strokeEnd = 10
        circleView.layer.addSublayer(circleLayer)
        
        
        //DRAW SQUARE
        let squareView = UIView(frame: CGRect(x: 10, y: 300, width: 200, height: 200))
        squareView.backgroundColor = UIColor.darkGray
        squareView.alpha = 0.7
        self.view.addSubview(squareView)
        
        let squarePath = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 100, height: 100),
                                      byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: 5, height: 5))

        let squareLayer = CAShapeLayer()
        squareLayer.path = squarePath.cgPath
        squareLayer.strokeColor = UIColor.red.cgColor
        squareLayer.fillColor = UIColor.green.cgColor
        squareLayer.lineWidth = 3
        squareLayer.strokeEnd = 10
        squareView.layer.addSublayer(squareLayer)
        
        
        let transformAn = CABasicAnimation(keyPath: "path")
        transformAn.duration = 5
        transformAn.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transformAn.fromValue = circlePath.cgPath
        transformAn.toValue = squarePath.cgPath
        
        squareLayer.add(transformAn, forKey: "animatePath")
    }


    
}
