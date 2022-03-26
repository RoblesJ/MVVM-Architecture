//
//  WeatherResponse.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation

struct WeatherResponse: Decodable {
    
    let name: Dynamic<String>
    let main: Weather
    
    ///setup the init to conform to the Dynamic type
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        main = try container.decode(Weather.self, forKey: .main)
    }
    enum CodingKeys: String, CodingKey {
        case name
        case main
    }
}

struct Weather: Decodable {
    
    var temp: Dynamic<Double>
    var feelsLike: Dynamic<Double>
    var tempMin: Dynamic<Double>
    var tempMax: Dynamic<Double>
    
    ///setup the init to conform to the Dynamic type
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temp = Dynamic(try container.decode(Double.self, forKey: .temp))
        feelsLike = Dynamic(try container.decode(Double.self, forKey: .feelsLike))
        tempMin = Dynamic(try container.decode(Double.self, forKey: .tempMin))
        tempMax = Dynamic(try container.decode(Double.self, forKey: .tempMax))
    }
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}
