//
//  WeatherModel.swift
//  Clima
//
//  Created by Slimn Srarena on 20/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    private var weatherConditions : NSDictionary?

    private let conditionID : Int
    private let city : String
    private let temperature : Double
    
    var iconName : String {
        let contionName = String(conditionID)
        if let validCondition = weatherConditions![contionName] {
            return validCondition as! String
        }
        else {
            return "sun.max"
        }
    }
    
    var temperatureString : String {
        return String(format: "%.1f", temperature)
    }
    
    var cityName : String {
        return city.capitalized
    }
    
    
    init(cityName : String, conditionID : Int, temperature : Double) {
        if let path = Bundle.main.path(forResource: "conditions", ofType: "plist") {
            self.weatherConditions = NSDictionary(contentsOfFile: path)
        }
        self.city = cityName
        self.conditionID = conditionID
        self.temperature = temperature
    }
}
