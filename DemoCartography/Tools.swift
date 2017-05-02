//
//  Tools.swift
//  DemoCartography
//
//  Created by winify on 5/2/17.
//  Copyright © 2017 misa.organization. All rights reserved.
//

import Foundation
import CoreGraphics


enum LINE_STYLE {
    case xStyle
}

struct CoordinatesForXLines {
   
    var firstLineStartPoint = CGPoint()
    var firstLineEndPoint = CGPoint()
    
    var secondLineStartPoint = CGPoint()
    var secondLineEndPoint = CGPoint()
}


/// Return coordinates where should be placed start point of the line
/// to be drawen in center of square in X form.
///
/// - Parameters:
///   - withSize: square size
///   - lineLenght: line leght
/// - Returns: Tuples which contain 'fromPoint' where should start line and
///                                 'toPoint' where line should end.
func coordinatesForLinesInSquare(withSize: CGSize, lineLenght: Float, withShowStyle line :LINE_STYLE) -> CoordinatesForXLines {
    
    let xMid = withSize.width/2
    let yMid = withSize.height/2
    let lineMid = CGFloat(lineLenght/2)
    var lineCoord = CoordinatesForXLines()
    
    if (line == LINE_STYLE.xStyle) {
        
        lineCoord.firstLineStartPoint = CGPoint(x: xMid - lineMid, y: yMid + lineMid)
        lineCoord.firstLineEndPoint = CGPoint(x: xMid + lineMid, y: yMid - lineMid)
        
        lineCoord.secondLineStartPoint = CGPoint(x: xMid - lineMid, y: yMid - lineMid)
        lineCoord.secondLineEndPoint = CGPoint(x: xMid + lineMid, y: yMid + lineMid)
        
        return lineCoord
    }
    
    return lineCoord
}
