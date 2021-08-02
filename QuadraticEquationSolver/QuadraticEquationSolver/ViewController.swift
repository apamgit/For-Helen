//
//  ViewController.swift
//  QuadraticEquationSolver
//
//  Created by Alexander Parnitsky on 31.07.21.
//  Copyright © 2021 Alexander Parnitsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textA: UITextField!
    @IBOutlet weak var textB: UITextField!
    @IBOutlet weak var textC: UITextField!
    @IBOutlet weak var buttonSolveIt: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var fieldAnswer: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fieldAnswer.isHidden = true  // when the value has not been entered

        
        textA.delegate = self
        textB.delegate = self
        textC.delegate = self
    }
    
    // reset text fields
    @IBAction func btnResetAction(_ sender: Any) {
        textA.text = ""
        textB.text = ""
        textC.text = ""
        fieldAnswer.text = ""
    }
    
    @IBAction func btnSolveItAction(_ sender: Any) {
        
        fieldAnswer.isHidden = false
        
        
        let a: Float! = (Float)(textA.text!)!
        let b: Float! = (Float)(textB.text!)!
        let c: Float! = (Float)(textC.text!)!
        
        var delta: Float
        var x1: Float
        var x2: Float
        
        if (a == 0 && b == 0 && c == 0) {
            fieldAnswer.text = "Equation has countless dependencies"
        }
        
        else if (a == 0) {
            fieldAnswer.text = "The equation has a solution x = \(-c/b)"
        }
        
        else {
            delta = b*b - 4*a*c
            if (delta == 0) {
                fieldAnswer.text = "The equation has a solution x = \(-b/2*a)"
            }
            else if (delta < 0) {
                fieldAnswer.text = "Void Equation"
            }
            else {
                x1 = (-b + (sqrt(delta))) / 2*a
                x2 = (-b - (sqrt(delta))) / 2*a
                fieldAnswer.text = "The equation has 2 distinct solutions:\n x1 = \(x1)\n x2 = \(x2) "
            }
        }
    }
    
    
    // Validation checks for input data
    
    func textField (_ textField: UITextField,
    shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    // Only allow users to enter numbers, not alphanumeric characters
    
    let inverseSet = NSCharacterSet(charactersIn: "0123456789").inverted
    
    let components = string.components(separatedBy: inverseSet)
    
    let filtered = components.joined(separator: "")
    
    if filtered == string {
        return true
    }
    else {
    if string == "." {  // check decimals
    let countdots = textField.text!.components (separatedBy: ".").count - 1
    if countdots == 0 {
    return true
    }
    else {
    if countdots > 0 && string == "." {
    return false
    }
    else {
        return true
        }
    }
    }
    else {
        if string == "-" {     // negative number
            if (textField.text!.isEmpty == true) {
                return true
            }
            else {
                return false
            }
        }
        else {
            return false
        }
        }
    }
    }
    
    
}

