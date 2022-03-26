//
//  WeatherViewModel.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation

class WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    private func toCelcius() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = Dynamic((weatherModel.temperature.value - 32) * 5/9)
            weatherModel.minTemperature = Dynamic((weatherModel.minTemperature.value - 32) * 5/9)
            weatherModel.maxTemperature = Dynamic((weatherModel.maxTemperature.value - 32) * 5/9)
            weatherModel.feelsLike = Dynamic((weatherModel.feelsLike.value - 32) * 5/9)
            return weatherModel
        }
    }
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = Dynamic((weatherModel.temperature.value * 9/5) + 32)
            weatherModel.minTemperature = Dynamic((weatherModel.minTemperature.value * 9/5) + 32)
            weatherModel.maxTemperature = Dynamic((weatherModel.maxTemperature.value * 9/5) + 32)
            weatherModel.feelsLike = Dynamic((weatherModel.feelsLike.value * 9/5) + 32)
            return weatherModel
        }
    }
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelcius()
        case.fahrenheit:
            toFahrenheit()
        }
    }
}
// Type Eraser

class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
}


class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Dynamic<Double>
    var minTemperature: Dynamic<Double>
    var maxTemperature: Dynamic<Double>
    var feelsLike: Dynamic<Double>
    var city: Dynamic<String>
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
        self.minTemperature = weather.main.tempMin
        self.maxTemperature = weather.main.tempMax
        self.feelsLike = weather.main.feelsLike
        self.city = weather.name
    }
    
}
