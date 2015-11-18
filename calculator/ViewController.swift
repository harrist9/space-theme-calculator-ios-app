//
//  ViewController.swift
//  calculator
//
//  Created by Thomas Harris on 10/29/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import UIKit
import iAd
import AdSupport

class ViewController: UIViewController {

    
@IBAction func infoPressed(sender: AnyObject) {
    let alertController = UIAlertController(title: "Info", message:
        "The Space Theme Background and app images were designed by FreePik", preferredStyle: UIAlertControllerStyle.Alert)
    alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
    
    self.presentViewController(alertController, animated: true, completion: nil)
    
    }
    

@IBOutlet weak var displayLabel: UILabel!
    
    var isFirstDigit = true
    var operand1: Double = 0
    var operation = "="
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
        }
        set {
            displayLabel.text  = "\(newValue)"
            isFirstDigit = true
            operation = "="
        }
    }
    

@IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        displayLabel.text = isFirstDigit ? digit : displayLabel.text! + digit
        isFirstDigit = false
    }
    
@IBAction func clearDisplay(sender: AnyObject) {
        displayValue = 0
    }
    
@IBAction func changeSign(sender: AnyObject) {
        displayValue = displayValue * -1
    }
    
@IBAction func precentCalc(sender: AnyObject) {
        displayValue = displayValue / 100
    }

@IBAction func saveOperand(sender: UIButton) {
        operation = sender.currentTitle!
        operand1 = displayValue
        isFirstDigit = true
       }
    
@IBAction func calculate(sender: AnyObject) {
        switch operation {
        case "÷":displayValue = operand1 / displayValue
        case "x":displayValue *= operand1 
        case "+":displayValue += operand1
        case "-":displayValue = operand1 - displayValue
        default:break
        }
    }
}
