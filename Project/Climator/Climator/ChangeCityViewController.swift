//
//  ChangeCityViewController.swift
//  Climator
//
//  Created by Slimn Srarena on 15/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    func userEnteredANewCityName(_ city: String);
}
class ChangeCityViewController: UIViewController {

    var delegate : ChangeCityDelegate?
    
    @IBOutlet weak var textFieldChangeCityName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateWeatherPressed(_ sender: UIButton) {
        // Get the city name
        let cityName: String = textFieldChangeCityName.text!
        
        // call delegate
        delegate?.userEnteredANewCityName(cityName)
        
        // dismiss the view
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
