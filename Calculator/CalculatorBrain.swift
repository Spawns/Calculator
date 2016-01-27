//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Plamen Duchev on 1/27/16.
//  Copyright © 2016 Plamen Duchev. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    enum Op {
    case Operand(Double)
    case UnitaryOperation(String, Double -> Double)
    case BinaryOperation(String, (Double, Double) -> Double)
    case BinaryOperation1(String, Double -> Double)
    case BinaryOperation2(String)
    }
    
    var opStack = [Op]()
    
    var knownOps = [String:Op]()
    
    init(){
        knownOps["×"]=Op.BinaryOperation("×") {$0*$1}
        knownOps["÷"]=Op.BinaryOperation("÷") {$1/$0}
        knownOps["+"]=Op.BinaryOperation("+") {$0+$1}
        knownOps["−"]=Op.BinaryOperation("−") {$1-$0}
        knownOps["√"]=Op.BinaryOperation1("√") {sqrt($0)}
        knownOps["sin˙"]=Op.BinaryOperation1("sin˙") {sin($0*M_PI/180.0)}
        knownOps["cos˙"]=Op.BinaryOperation1("cos˙") {cos($0*M_PI/180.0)}
        knownOps["π"]=Op.BinaryOperation2("π")

    }
    
    func pushOperand(operand: Double){
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String){
    
    }
    
}