//
//  MenuViewController.swift
//  testProgramm2DCurves
//
//  Created by Иван Кочетков on 04.08.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var selectCurve: UISegmentedControl!
    @IBOutlet weak var startPointX: UITextField!
    @IBOutlet weak var startPointY: UITextField!
    @IBOutlet weak var directionX: UITextField!
    @IBOutlet weak var directionY: UITextField!
    @IBOutlet weak var tValue: UITextField!
    @IBOutlet weak var numberOfPoints: UITextField!
    @IBOutlet weak var radiusX: UITextField!
    @IBOutlet weak var radiusY: UITextField!
    
    @IBAction func enterButton(_ sender: Any) {
        if let doubleDirectionX = Double(directionX.text ?? "0"), let doubleDirectionY = Double(directionY.text ?? "0"), let uintNumberOfPoints = UInt(numberOfPoints.text ?? "0"){
            if (doubleDirectionX != 0 || doubleDirectionY != 0) && uintNumberOfPoints > 1{
                performSegue(withIdentifier: "graphic", sender: Any?.self)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  segue.identifier == "graphic" else {return}
        guard let destination = segue.destination as? ViewController else {return}
        destination.tString = tValue.text
        destination.numberOfPoints = numberOfPoints.text
        if selectCurve.selectedSegmentIndex == 0{
            destination.startX = startPointX.text
            destination.startY = startPointY.text
            destination.directionX = directionX.text
            destination.directionY = directionY.text
        } else {
            destination.radX = radiusX.text
            destination.radY = radiusY.text
            destination.segment = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
