//
//  WeatherDeatilsViewController.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation
import UIKit
 
class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVMBindings()
    }
    
    
    private func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.city.bind {self.cityNameLabel.text = $0}
            weatherVM.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree() }
            weatherVM.minTemperature.bind { self.minTempLabel.text = $0.formatAsDegree() }
            weatherVM.maxTemperature.bind { self.maxTempLabel.text = $0.formatAsDegree() }
        }
        // change the value after a few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.weatherViewModel?.city.value = "Boston"
        }
    }
    
}
