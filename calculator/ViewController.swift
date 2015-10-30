//
//  ViewController.swift
//  calculator
//
//  Created by Thomas Harris on 10/29/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcDisplay: UILabel!
    
    enum Operation: String {
        
        case Divde = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        case Precent = "%"
        case Invert = "+/-"
        
    }
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func digitPressed(button: UIButton!){
        
        runningNumber += "\(button.tag)"
        calcDisplay.text = runningNumber
        
    }
    
    
    @IBAction func dividePressed(sender: AnyObject) {
        conductOperation(Operation.Divde)
    }
    
    @IBAction func multiplyPressed(sender: AnyObject) {
        conductOperation(Operation.Multiply)
    }
    
    @IBAction func subtractPressed(sender: AnyObject) {
        conductOperation(Operation.Subtract)
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        conductOperation(Operation.Add)
        
    }

    @IBAction func precentPressed(sender: AnyObject) {
        conductOperation(Operation.Precent)
    }
    
    @IBAction func invertSignPressed(sender: AnyObject) {
        conductOperation(Operation.Invert)
    }
    
    @IBAction func allClearPressed(sender: AnyObject) {
        allClear()
    }
    
    @IBAction func equalPressed(sender: AnyObject) {
        conductOperation(currentOperation)
    }
    
    func allClear(){
        
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
        calcDisplay.text = "0"
    }
    
    
    func conductOperation(op: Operation) {
        
        if currentOperation != Operation.Empty {
            //Run some math
            //A user seleted an operator, but then selected another operator without first entering a number
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if currentOperation == Operation.Divde {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }else if currentOperation == Operation.Precent {
                    result = "\(Double(leftValStr)! / 100)"
                }else if currentOperation == Operation.Invert {
                    result = "-\(Double(leftValStr)!)"
                }
               
                leftValStr = result
                calcDisplay.text = result
                
            }
            
            currentOperation = op
            
        }else {
            //This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
        
    }
    
}

