//
//  Ellipse.swift
//  testProgramm2DCurves
//
//  Created by Иван Кочетков on 31.07.2021.
//

import Foundation

class Ellipse: Curves {
    
    let xRad: Double
    let yRad: Double
    let t: Double
    
    init(xRad: Double, yRad: Double, t: Double, numberOfPoints: UInt) {
        self.xRad = xRad
        self.yRad = yRad
        self.t = t
        super.init(numberOfPoints: numberOfPoints)
    }
    
    override func point(t: Double) -> [Point] {
        
        //I think t = x
        let x = t
        //I had to split the calculation of y into several operations
        let z = yRad * yRad
        let q = xRad * xRad
        var xPoints = [Point]()
        let y1 = sqrt(z - z * (x * x) / q)
        let y2 = -1 * y1
        
        if y1 != y2{
            xPoints.append(Point(x: x, y: y1))
            xPoints.append(Point(x: x, y: y2))
        } else {
            xPoints.append(Point(x: x, y: y1))
        }
        return (xPoints)
    }
    
    override func derivative(t: Double) -> [SIMD2<Double>] {
        let z = yRad * yRad
        let q = xRad * xRad
        let tPoints = (point(t: t))
        let y11 = z / tPoints[0].y - z * tPoints[0].x * t / (q * tPoints[0].y)
        let y21 = z / tPoints[0].y - z * tPoints[0].x * 2*t / (q * tPoints[0].y)
        let y12 = z / tPoints[1].y - z * tPoints[1].x * t / (q * tPoints[1].y)
        let y22 = z / tPoints[1].y - z * tPoints[1].x * 2*t / (q * tPoints[1].y)
        return [SIMD2<Double>(x: t, y: y21 - y11), SIMD2<Double>(x: t, y: y22 - y12)]
    }
}
