//
//  Curves.swift
//  testProgramm2DCurves
//
//  Created by Иван Кочетков on 05.08.2021.
//

import Foundation

class Curves{
    var numberOfPoints: UInt
    let point = Point(x: 0, y: 0)
    
    init(numberOfPoints: UInt){
        self.numberOfPoints = numberOfPoints
    }
    func point(t: Double) -> [Point]{
        return [point]
    }
    
    func derivative(t: Double) -> [SIMD2<Double>]{
        return [SIMD2<Double>(x: 0, y: 0)]
    }
}
