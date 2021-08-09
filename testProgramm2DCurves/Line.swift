//
//  Line.swift
//  testProgramm2DCurves
//
//  Created by Иван Кочетков on 31.07.2021.
//

import Foundation
import simd

class Line: Curves {
    
    var startPoint: Point
    let direction: SIMD2<Double>
    let t: Double
    //var numberOfPoints: UInt
    
    init(startPoint: Point, direction: SIMD2<Double>, numberOfPoints: UInt, t: Double) {
        
        self.startPoint = startPoint
        self.direction = direction
       // self.numberOfPoints = numberOfPoints
        self.t = t
        super.init(numberOfPoints: numberOfPoints)
    }
    
    override func point(t: Double) -> [Point] {
        
        return[(Point(x: startPoint.x + direction.x / direction.y * t, y: startPoint.y + direction.y / direction.x * t))]
    }
    
    override func derivative(t: Double) ->  [SIMD2<Double>] {
        
        return [direction]
    }
}

struct Point {
    var x, y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
