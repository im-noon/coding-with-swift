//
//  ViewController.swift
//  Calculator
//
//  Created by Slimn Srarena on 10/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTypeingNumber : Bool = false
    
    var calculator = CalculatorLogic()

    var displayValue : Double {
        get {
            guard let currentDoubleValue = Double(displayLabel.text!) else {
                fatalError("Error convertion string to Double!")
            }
            return currentDoubleValue
        }
        set {
            let isInt = floor(newValue) == newValue
            if isInt {
                displayLabel.text = String(Int(newValue))
            }
            else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayValue = 0;
    }

    @IBAction func celcButtonPressed(_ sender: UIButton) {
        isFinishTypeingNumber = true
        
        if let symbol = sender.currentTitle {
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol) {
                displayValue = result
            }
        }
    }
    
    func appendNumber(from fromNumber : String, into toNumber : String) -> String {
        var newDisplayValue : String = toNumber
        
        if fromNumber == "." {
            if isFinishTypeingNumber {
                newDisplayValue =  "0" + fromNumber
            }
            else {
                guard let currentDisplayValue = Double(toNumber) else { fatalError("\(#line) Can not convert number") }
                
                let isInt = floor(currentDisplayValue) == currentDisplayValue
                if isInt {
                    newDisplayValue +=  fromNumber
                }
            }
        }
        else {
            if displayLabel.text! == "0" {
                
                print("\(#line) \(fromNumber)")
                if fromNumber == "." {
                    newDisplayValue +=  fromNumber
                }
                else if fromNumber != "0" {
                    newDisplayValue =  fromNumber
                }
            }
            else {
                
                print("\(#line) \(fromNumber)")
                newDisplayValue +=  fromNumber
            }
        }
        
        return newDisplayValue
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            
            if isFinishTypeingNumber {
                if number == "." {
                    displayLabel.text = appendNumber(from:number, into:displayLabel.text!)
                }
                else {
                    displayLabel.text = number
                }
                
                isFinishTypeingNumber = false
            }
            else {
                print("\(#line) \(number)")
                displayLabel.text = appendNumber(from:number, into:displayLabel.text!)
            }
        }
    }
}

