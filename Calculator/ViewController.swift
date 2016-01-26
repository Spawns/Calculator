//
//  ViewController.swift
//  Calculator
//
//  Created by Plamen Duchev on 1/25/16.
//  Copyright © 2016 Plamen Duchev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber=true
        }
    }
    

    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        switch operation {
            case "×": performOperation {$0*$1}
            case "÷": performOperation {$1/$0}
            case "+": performOperation {$0+$1}
            case "−": performOperation {$1-$0}
            case "√": performOperation1 {sqrt($0)}
            case "sin˙": performOperation1 {sin($0*M_PI/180.0)}
            case "cos˙": performOperation1 {cos($0*M_PI/180.0)}
            case "π": performOperation2 ()
            default: break
        }
    }
    
    func performOperation (operation: (Double, Double) -> Double){
        if operandStack.count >= 2{
            displayValue = operation (operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation1 (operation: Double -> Double){
        if operandStack.count >= 1{
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation2 (){
        displayValue = M_PI
        enter()
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
    }

    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text  = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
}

