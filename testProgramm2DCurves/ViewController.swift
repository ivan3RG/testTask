//
//  ViewController.swift
//  testProgramm2DCurves
//
//  Created by Иван Кочетков on 31.07.2021.
//

import UIKit

var line: Line  = Line(startPoint: Point(x: 0, y: 0), direction: SIMD2(0, 0), numberOfPoints: 0, t: 0)
var ellipse: Ellipse = Ellipse(xRad: 0, yRad: 0, t: 0, numberOfPoints: 0)
//let size: CGRect = UIScreen.main.bounds
var segmentStatement: Bool  = false

class ViewController: UIViewController {
    
    var startX: String?
    var startY: String?
    var directionX: String?
    var directionY: String?
    var tString: String?
    var numberOfPoints: String?
    var radX: String?
    var radY: String?
    var segment: Bool = true
    
    let graphicView = GraphicView(frame: CGRect(x: UIScreen.main.bounds.minX, y: UIScreen.main.bounds.minY, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    
    func sendParameters(){
        if segment == true {
            segmentStatement = true
            let doubleStartX = Double(startX ?? "0")
            let doubleStartY = Double(startY ?? "0")
            let startPoint = Point(x: doubleStartX!, y: doubleStartY!)
            let doubleDirectionX = Double(directionX ?? "0")
            let doubleDirectionY = Double(directionY ?? "0")
            let direction = SIMD2(doubleDirectionX!, doubleDirectionY!)
            let doubleT = Double(tString!)
            let intNumberOfPoints = UInt(numberOfPoints!)
        
            line = Line(startPoint: startPoint, direction: direction, numberOfPoints: intNumberOfPoints!, t: doubleT!)
        } else {
            let doubleRadX = Double(radX ?? "0")
            let doubleRadY = Double(radY ?? "0")
            let doubleT = Double(tString!)
            let intNumberOfPoints = UInt(numberOfPoints!)
            
            ellipse = Ellipse(xRad: doubleRadX!, yRad: doubleRadY!, t: doubleT!, numberOfPoints: intNumberOfPoints!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendParameters().self
        // Do any additional setup after loading the view.
        graphicView.setNeedsDisplay()
        graphicView.setNeedsLayout()
        }
}
