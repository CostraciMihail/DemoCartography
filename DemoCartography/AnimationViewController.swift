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
        
        
        
        //UNCOMMENT TO ANIMATE CIRCLE AND SQUARE DRAWING
//        animateDrawingCircleSquare()

        
        //UNCOMMENT TO DRAW STRAIT LINE
//        let drawV = DrawView(frame: CGRect(x: 10, y: 30, width: 200, height: 200))
//        drawV.backgroundColor = UIColor.white
//        self.view.addSubview(drawV)

        
        //UNCOMMENT TO ANIMATE DRAWING CIRCLE
//        self.animateDrawingCircle()
        
        
        self.animateDrawingXLine()
        
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

    
    func animateDrawingCircle() {
        
        let dView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        dView.backgroundColor = UIColor.white
        self.view.addSubview(dView)
        
        
        //CIRCLE PATH
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 30, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        circlePath.lineWidth = 3
        
        let shapeLayer = CAShapeLayer(layer: self.view.layer)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.path = circlePath.cgPath
        shapeLayer.lineWidth = 3
        shapeLayer.miterLimit = 3
        shapeLayer.lineCap = kCALineCapRound
        
        dView.layer.addSublayer(shapeLayer)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 5
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        shapeLayer.add(animation, forKey: "strokeEnd")
        
    }
    
    
    func animateDrawingXLine() {
        
        let laySize = CGSize(width: 200, height: 200)
        let lineLenght = Float(80)
        let fromPoint = coordinatesForLinesInSquare(withSize: laySize, lineLenght: lineLenght, withShowStyle: .xStyle)
        
        // X VIEW
        //BEZIER
        let xPath = UIBezierPath()
        xPath.lineWidth = 5
        xPath.move(to: CGPoint(x: fromPoint.firstLineStartPoint.x, y: fromPoint.firstLineStartPoint.y))
        xPath.addLine(to: CGPoint(x: fromPoint.firstLineEndPoint.x, y: fromPoint.firstLineEndPoint.y))

        xPath.move(to: CGPoint(x: fromPoint.secondLineStartPoint.x, y: fromPoint.secondLineStartPoint.y))
        xPath.addLine(to: CGPoint(x: fromPoint.secondLineEndPoint.x, y: fromPoint.secondLineEndPoint.y))
        
        //LAYER
        let firstSL = CAShapeLayer()
        firstSL.frame = CGRect(x: 10, y: 30, width: laySize.width, height: laySize.height)
        firstSL.path = xPath.cgPath
        firstSL.fillColor = UIColor.clear.cgColor
        firstSL.strokeColor = UIColor.black.cgColor
        firstSL.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(firstSL)
        
        //PARALEL VIEW
        //BEZIER
        let paralelPath = UIBezierPath()
        paralelPath.lineWidth = 5
        paralelPath.move(to: CGPoint(x: fromPoint.firstLineStartPoint.x, y: fromPoint.firstLineStartPoint.y))
        paralelPath.addLine(to: CGPoint(x: fromPoint.firstLineStartPoint.x + CGFloat(lineLenght), y: fromPoint.firstLineStartPoint.y))
        
        paralelPath.move(to: CGPoint(x: fromPoint.secondLineStartPoint.x, y: fromPoint.secondLineStartPoint.y))
        paralelPath.addLine(to: CGPoint(x: fromPoint.secondLineStartPoint.x + CGFloat(lineLenght), y: fromPoint.secondLineStartPoint.y))
        
        //LAYER
        let secondSL = CAShapeLayer()
        secondSL.frame = CGRect(x: 10, y: 30, width: laySize.width, height: laySize.height)
        secondSL.path = paralelPath.cgPath
        secondSL.fillColor = UIColor.clear.cgColor
        secondSL.strokeColor = UIColor.black.cgColor
        secondSL.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(secondSL)
        
        
        //ANIMATION
        let drawLineAnim = CABasicAnimation(keyPath: "path")
        drawLineAnim.duration = 0.5
        drawLineAnim.fromValue = secondSL.path
        drawLineAnim.toValue = xPath.cgPath
        drawLineAnim.fillMode = kCAFillModeForwards
        drawLineAnim.isRemovedOnCompletion = false
//        secondSL.add(drawLineAnim, forKey: "animateLines")
        
        let lineWidthAnimation = CABasicAnimation(keyPath: "lineWidth")
        lineWidthAnimation.duration = 0.5
        lineWidthAnimation.fromValue = 5.0
        lineWidthAnimation.toValue = 10.0
        lineWidthAnimation.fillMode = kCAFillModeForwards
        lineWidthAnimation.isRemovedOnCompletion = false
//        secondSL.add(animation, forKey: "animateLines")
        
        print("timeNow: \(Date().timeIntervalSinceNow + 3)")
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 3
        groupAnimation.duration = 3.5
        groupAnimation.animations = [drawLineAnim, lineWidthAnimation]
        groupAnimation.isRemovedOnCompletion = false
        
        secondSL.add(groupAnimation, forKey: "groupAnimation")
    }
}


class DrawView: UIView {
    
    override func draw(_ rect: CGRect) {
        
//        self.drawStrighLine()
//        self.animateDrawLine()
        self.animatedrawSomeLines()
    }
    
   internal func drawStrighLine() {
        
        //BEZIER PATH
        let endPoint = CGPoint(x: 100, y: 5)
        
        let strighLinePath = UIBezierPath()
        strighLinePath.move(to: CGPoint(x: 10, y: 5))
        strighLinePath.addLine(to: endPoint)
        strighLinePath.lineWidth = 4
        strighLinePath.stroke()
    }
    
    internal func animateDrawLine() {
        
        //LINE PATH
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 100, y: 30))
        linePath.addLine(to: CGPoint(x: 10, y: 100))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = linePath.cgPath
        shapeLayer.lineWidth = 4
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0.7

        self.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.duration = 8
        animation.fromValue = NSNumber(value: 0.0)
        animation.toValue = NSNumber(value: 1.0)
        
        shapeLayer.add(animation, forKey: "strokeEnd")
        
    }
    
    
    internal func animatedrawSomeLines() {
    
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 22.5, y: 28.5))
        bezierPath.addCurve(to: CGPoint(x: 59.5, y: 50.5), controlPoint1: CGPoint(x: 85.5, y: 26.5), controlPoint2: CGPoint(x: 59.5, y :50.5))
        bezierPath.addLine(to: CGPoint(x: 104.5, y: 60.5))
        bezierPath.addLine(to: CGPoint(x: 97.5, y: 28.5))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        self.layer.addSublayer(shapeLayer)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 5
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        shapeLayer.add(animation, forKey: "strokeEnd")
        
        
//        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
//    [bezierPath moveToPoint: CGPointMake(22.5, 28.5)];
//        
//    [bezierPath addCurveToPoint: CGPointMake(59.5, 50.5) controlPoint1: CGPointMake(85.5, 26.5) controlPoint2: CGPointMake(59.5, 50.5)];
//    
//        [bezierPath addLineToPoint: CGPointMake(104.5, 60.5)];
//        
//    [bezierPath addLineToPoint: CGPointMake(97.5, 28.5)];
//    [UIColor.blackColor setStroke];
//    bezierPath.lineWidth = 1
//    
    
    }
    
}
