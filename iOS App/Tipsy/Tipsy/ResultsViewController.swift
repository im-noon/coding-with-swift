//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Slimn Srarena on 19/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var percentageTip: Int = 10
    var numberOfPeople: Int = 2
    var totalBillValues: Double = 0.0
    

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(percentageTip)% tip."
        if totalBillValues > 0 {
            let tipCost = (Double(totalBillValues) * Double(percentageTip))/100
            
            let billCost = (totalBillValues + tipCost)/Double(numberOfPeople)
            
            totalLabel.text = String(format: "%0.2f", billCost)
        }
        else {
            totalLabel.text = ""
        }
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
