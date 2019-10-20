//
//  WeatherManager.swift
//  Clima
//
//  Created by Slimn Srarena on 19/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate: AnyObject {
    func didUpdateWeather(_ manger : WeatherManager, _ weather : WeatherModel)
    func didFailWithError(error : Error)
}

class WeatherManager {
    
    weak var delegate: WeatherManagerDelegate?
    
    let openWeatherMapAPIKey = "YOUR API KEY"
    let weatherByCityURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid="
    let weatherByLocation = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid="
    
    func fetchCurrentWeather(cityName name: String)  {
        let urlString = "\(weatherByCityURL)\(openWeatherMapAPIKey)&q=\(name)"
        performRequest(with: urlString)
    }

    func fetchCurrentWeather(latitude lat : Double, longitude lon : Double)  {
        let urlString = "\(weatherByLocation)\(openWeatherMapAPIKey)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)

    }
    
    func performRequest(with urlString: String) {

        if let requestURL = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let dataTask = session.dataTask(with: requestURL) { (data, resonse, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error:error!)
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            
            dataTask.resume()
            
        }
    }
    
    func parseJSON(weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            return WeatherModel(cityName: name, conditionID: id, temperature: temp)

        } catch  {
            self.delegate?.didFailWithError(error:error)
            return nil
        }
    }

}
