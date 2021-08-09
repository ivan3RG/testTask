//
//  GraphicView.swift
//  testProgramm2DCurves
//
//  Created by Иван Кочетков on 31.07.2021.
//

import UIKit

class GraphicView: UIView {
    
    let patch = UIBezierPath()
    let size = UIScreen.main.bounds
    
    override func draw(_ rect: CGRect) {
        
        //let step = 2 * Double.pi / Double(line.numberOfPoints)
        let stepLine = Double(size.maxX) / Double(line.numberOfPoints)
        let stepEllipse = 2 * Double(ellipse.xRad) / Double(ellipse.numberOfPoints)
        var tI: Double = 0
        
        if segmentStatement == false{
            tI = -ellipse.xRad
            var points = [Point]()
            for _ in 0...ellipse.numberOfPoints - 1 {
                let a = ellipse.point(t: tI)
                points.append(a[0])
                if a.count > 1{
                    points.append(a[1])
                }
                tI = tI + stepEllipse
            }
            
            for i in 0...points.count - 1{
                print(points[i])
            }
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: Double(size.maxX) / 2 - ellipse.xRad / 2, y: Double(size.maxY) / 2 - ellipse.yRad / 2, width: ellipse.xRad, height: ellipse.yRad))
            print("in t = pi/4 ellipse = ", ellipse.point(t: Double.pi / 4), "\n derivative = ", ellipse.derivative(t: Double.pi / 4))
            ovalPath.lineWidth = 3
            UIColor.red.setStroke()
            ovalPath.stroke()
        } else {
            var points = [Point]()
            for _ in 0...line.numberOfPoints - 1 {
                let a = line.point(t: tI)
                points.append(contentsOf: a)
                tI = tI + stepLine
            }
            print("in t = pi/4 line = ", line.point(t: Double.pi / 4), "\n derivative = ", line.derivative(t: Double.pi / 4))
            print("line derivative is ", line.derivative(t: 0)) // because line derivative is scalar
            let graphicPatch = UIBezierPath()
            graphicPatch.move(to: CGPoint(x: points[0].x + (Double(size.maxX) / 2), y: (Double(size.maxY) / 2) - points[0].y ))
            graphicPatch.addLine(to: CGPoint(x: points[Int(line.numberOfPoints) - 1].x + (Double(size.maxX) / 2), y: (Double(size.maxY) / 2) - points[Int(line.numberOfPoints) - 1].y))
            for i in 0...line.numberOfPoints - 1 {
                print(points[Int(i)])
            }
            graphicPatch.lineWidth = 3
            UIColor.red.setStroke()
            graphicPatch.stroke()
        }
        
        
        let xPatch = UIBezierPath()
        xPatch.move(to: CGPoint(x: size.minX, y: size.maxY / 2))
        xPatch.addLine(to: CGPoint(x: size.maxX, y: size.maxY / 2))
        xPatch.addLine(to: CGPoint(x: size.maxX - 10, y: (size.maxY / 2) - 10))
        xPatch.addLine(to: CGPoint(x: size.maxX - 10, y: (size.maxY / 2) + 10))
        xPatch.addLine(to: CGPoint(x: size.maxX, y: size.maxY / 2))
        
        let yPatch = UIBezierPath()
        yPatch.move(to: CGPoint(x: size.maxX / 2, y: size.maxY))
        yPatch.addLine(to: CGPoint(x: size.maxX / 2, y: size.minY))
        yPatch.addLine(to: CGPoint(x: (size.maxX / 2) - 10, y: size.minY + 10))
        yPatch.addLine(to: CGPoint(x: (size.maxX / 2) + 10, y: size.minY + 10))
        yPatch.addLine(to: CGPoint(x: size.maxX / 2, y: size.minY))
        
        UIColor.red.setStroke()
        
        xPatch.lineWidth = 3
        yPatch.lineWidth = 3
        xPatch.stroke()
        yPatch.stroke()
    }
}


