//
//  ViewController.swift
//  Tipsy
//
//  Created by Slimn Srarena on 19/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var percentageTip: Int = 10
    var numberOfPeople: Int = 2
    var totalBillValues: Double = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalBillValues = 0;
    }
    

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
        }
        else if sender == tenPctButton {
            tenPctButton.isSelected = true
        }
        else if sender == twentyPctButton {
            twentyPctButton.isSelected = true
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChnaged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
        billTextField.endEditing(true)
    }
    
  
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected {
            percentageTip = 0
        }
        else if tenPctButton.isSelected {
            percentageTip = 10
        }
        else if twentyPctButton.isSelected {
            percentageTip = 20
        }
        
        debugPrint("line:\(#line) \(#function) \ntip percentage : \(percentageTip) \npeople to split the bill : \(numberOfPeople) \ntotal bill value : \(totalBillValues)")
        if totalBillValues > 0 {
            performSegue(withIdentifier: "showResult", sender: self)
        }
        else {
            let alert = UIAlertController(title: "Bill is empty! ", message: "Please enter bill value first, and calculation again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let destinationVC = segue.destination as? ResultsViewController {
                destinationVC.totalBillValues = totalBillValues
                destinationVC.numberOfPeople = numberOfPeople
                destinationVC.percentageTip = percentageTip
            }
        }
    }
}

extension CalculatorViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let value = Double(textField.text!) ?? 0.0
        totalBillValues = value
        debugPrint("line:\(#line) \(#function) \(value)")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        debugPrint("line:\(#line) \(#function) \(String(describing: textField.text))")
    }
}
