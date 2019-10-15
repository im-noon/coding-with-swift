//
//  WeatherViewController.swift
//  Climator
//
//  Created by Slimn Srarena on 15/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {

    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "3b7d2ec2e66b90fd279e60a5064b5e68"
    
    let locationManager = CLLocationManager()
    let weatherData = WeatherDataModel()
    
    @IBOutlet weak var buttonChangeCity: UIButton!
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    

    //MARK: - Networking
    /***************************************************************/
    
    //getWeatherData method:
    func getWeatherData(url: String, param: [String: String]) {
        AF.request(url, parameters: param).responseJSON { response in
            if response.error == nil {
                debugPrint("Success! Got the weather data")
                let weatherJSON : JSON = JSON(response.value!)
                debugPrint(weatherJSON)
                self.updateWeatherData(weatherJSON)
            }
            else {
                if let errorDescription = response.error?.localizedDescription {
                    debugPrint("Error : \(errorDescription)")
                    self.labelCityName.text = "Connection Issues"
                }
            }
        }
    }
    
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    //updateWeatherData method:
    func updateWeatherData(_ json: JSON) {
        if let tempResult = json["main"]["temp"].double {
            weatherData.temperature = Int(tempResult - 273.15)
            weatherData.city = json["name"].stringValue
            weatherData.condition = json["weather"][0]["id"].intValue
            weatherData.weatherIconName = weatherData.updateWeatherIcon(weatherData.condition)
            //weatherData.city =
            
            updateWeatherWithWeatherData()
        }
        else {
            labelCityName.text = "Weather Unavailable"
        }
    }
    
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //updateUIWithWeatherData method:
    func updateWeatherWithWeatherData() {
        labelCityName.text = weatherData.city
        labelTemperature.text = "\(weatherData.temperature) C˚"
        weatherIcon.image = UIImage(named: weatherData.weatherIconName)
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //didUpdateLocations method:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location : CLLocation = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude : Double = location.coordinate.latitude
            let longitue : Double = location.coordinate.longitude
            let param : [String : String] = ["lat": String(latitude), "lon": String(longitue), "appid": APP_ID]
            
            getWeatherData(url: WEATHER_URL, param: param)

        }
    }
    
    
    //didFailWithError method:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        labelCityName.text = "Location Unavailable"
    }
    
    
    
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //userEnteredANewCityName Delegate method:
    func userEnteredANewCityName(_ city: String) {
        debugPrint(city)
        let param : [String : String] = ["q": String(city), "appid": APP_ID]
        getWeatherData(url: WEATHER_URL, param: param)
    }
    
    
    //PrepareForSegue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
            
        }
    }
}
