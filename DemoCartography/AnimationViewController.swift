//
//  AnimationViewController.swift
//  DemoCartography
//
//  Created by winify on 4/27/17.
//  Copyright © 2017 misa.organization. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        
//        animateDrawingCircleSquare()

        let drawV = DrawView(frame: CGRect(x: 10, y: 30, width: 120, height: 120))
        drawV.backgroundColor = UIColor.white
        self.view.addSubview(drawV)
        
    }
    
    

    func animateDrawingCircleSquare() {
        
        //DRAW CIRCLE
        let circleView = UIView(frame: CGRect(x: 10, y: 50, width: 200, height: 200))
        circleView.backgroundColor = UIColor.white
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
        squareView.backgroundColor = UIColor.white
        self.view.addSubview(squareView)
        
        let squarePath = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 100, height: 100),
                                      byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: 5, height: 5))
        
        let squareLayer = CAShapeLayer()
        squareLayer.path = squarePath.cgPath
        squareLayer.strokeColor = UIColor.red.cgColor
        squareLayer.fillColor = UIColor.green.cgColor
        squareLayer.lineWidth = 6
        squareLayer.strokeStart = 0
        squareLayer.strokeEnd = 1
        squareView.layer.addSublayer(squareLayer)
        
        
        let transformAn = CABasicAnimation(keyPath: "path")
        transformAn.duration = 7
        transformAn.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transformAn.fromValue = circlePath.cgPath
        transformAn.toValue = squarePath.cgPath
        
        squareLayer.add(transformAn, forKey: "animatePath")
    }

    
}


class DrawView: UIView {
    
    
    override func draw(_ rect: CGRect) {
        
        self.drawStrighLine()
    }
    
    func drawStrighLine() {
        
        //BEZIER PATH
        let endPoint = CGPoint(x: 100, y: 5)
        let cp1 = CGPoint(x: 20, y: 5)
        let cp2 = CGPoint(x: 50, y: 5)
        
        let strighLinePath = UIBezierPath()
        strighLinePath.move(to: CGPoint(x: 10, y: 5))
        strighLinePath.addLine(to: endPoint)
        strighLinePath.lineWidth = 4
        strighLinePath.stroke()
    }
    
}
