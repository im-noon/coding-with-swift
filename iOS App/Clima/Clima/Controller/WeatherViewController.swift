//
//  ViewController.swift
//  Clima
//
//  Created by Slimn Srarena on 19/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import ProgressHUD
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    let ultraLightConfiguration = UIImage.SymbolConfiguration(weight: .light)
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetWeatherInfo()
        // request upermission
        locationManager.delegate = self
        weatherManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        //weatherManager.fetchCurrentWeather(city: nil, lat: String(13.737494), lon: String(100.536401))
    }

    @IBAction func currentLocationPressed(_ sender: UIButton) {
        ProgressHUD.show()
        locationManager.requestLocation()
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func resetWeatherInfo() {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
            self.cityLabel.text = ""
            self.temperatureLabel.text = ""
            
            self.conditionImageView.image = UIImage(systemName: "exclamationmark.icloud", withConfiguration:self.ultraLightConfiguration)
        }
    }
    
    func updateWeatherNotFound() {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
            self.cityLabel.text = "The weather data is missing."
            self.temperatureLabel.text = "??"
            
            self.conditionImageView.image = UIImage(systemName: "exclamationmark.icloud", withConfiguration:self.ultraLightConfiguration)
        }
    }
}

//MARK - UITextFieldDelegate
extension WeatherViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Enter city name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            ProgressHUD.show()
            weatherManager.fetchCurrentWeather(cityName: city)
        }
        // Clear textField
        textField.text = ""
    }
}

//MARK - WeatherManagerDelegate
extension WeatherViewController : WeatherManagerDelegate {
    
    func didUpdateWeather(_ manger: WeatherManager, _ weather: WeatherModel) {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            
            self.conditionImageView.image = UIImage(systemName: weather.iconName, withConfiguration:self.ultraLightConfiguration)
        }
    }
    
    func didFailWithError(error: Error) {

        debugPrint("line:\(#line) \(#function) : \(error.localizedDescription)")
        updateWeatherNotFound()
    }
}


//MARK - CoreLocation
extension WeatherViewController:CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        if let location = locations.last {
            ProgressHUD.show()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchCurrentWeather(latitude: lat, longitude: lon)
            print("Found user's location: \(lat) \(lon)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        updateWeatherNotFound()
    }
}
