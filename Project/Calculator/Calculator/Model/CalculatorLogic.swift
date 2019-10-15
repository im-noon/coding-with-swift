//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Slimn Srarena on 11/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var operance1:(n1:Double, calMethod:String)?
    
    mutating func setNumber(_ number :Double) {
        self.number = number
    }
    
    private func performTwoNumberCalculation(n2 :Double) -> Double? {
        if let n1 = operance1?.n1, let operation = operance1?.calMethod {
            switch operation {
                case "÷" :
                    return n1 / n2
                case "×" :
                    return n1 * n2
                case "+" :
                    return n1 + n2
                case "-" :
                    return n1 - n2
                default:
                    fatalError("\(#line) Can not convert number")
            }
        }
        return n2;
    }
    
    
    mutating func calculate(_ symbol : String) -> Double? {
        if let value = number {
            if symbol == "AC" {
                operance1 = nil;
                
                return 0
            }
            else if symbol == "%" {
                return value * 0.01
            }
            else if symbol == "+/-" {
                return value * -1
            }
            else if symbol == "=" {
                return performTwoNumberCalculation(n2:value)
            }
            else {
                if let _ = operance1?.n1, let _ = operance1?.calMethod {
                    let result = performTwoNumberCalculation(n2:value)
                    operance1 = (n1:Double(result!), calMethod: symbol)
                    return result
                }
                else{
                    operance1 = (n1:value, calMethod: symbol)
                    return value
                }
            }
        }
        
        return nil
    }
}
