//
//  WeatherData.swift
//  Clima
//
//  Created by Slimn Srarena on 20/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    
    let name : String
    let id : Int
    let dt : Int
    let timezone : Int
    let visibility : Int
    let cod : Int
    let base : String
//    
    let main : Main
    let coord : Coordinate
    let weather : [Weather]
    let sys : System
    let wind : Wind
   //
    let clouds : Clouds
//    
}

struct Main : Decodable {
    let temp : Double
    let pressure : Double
    let humidity : Double
    let temp_min : Double
    let temp_max : Double
    //let sea_level : Double
    //let grnd_level : Double
}

struct Weather : Decodable {
    let id : Int
    let main : String
    let description : String
    let icon : String
}

struct Coordinate : Decodable {
    let lon : Double
    let lat : Double
}


struct System : Decodable {
    let type : Int
    let id : Int
    let message : Double
    let country : String
    let sunrise : Int
    let sunset : Int
}

struct Wind : Decodable {
    let speed : Double
    let deg : Double
}

struct Clouds : Decodable {
    let all : Double
}
