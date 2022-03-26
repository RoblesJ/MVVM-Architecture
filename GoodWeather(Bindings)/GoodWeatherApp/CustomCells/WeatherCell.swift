//
//  WeatherCell.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation
import UIKit


class WeatherCell: UITableViewCell {
    
    @IBOutlet
    weak var cityNameLabel: UILabel!
    @IBOutlet
    weak var temperatureLabel: UILabel!
    
    override func prepareForReuse() {
    
        super.prepareForReuse()
        self.cityNameLabel.text = ""
        self.temperatureLabel.text = ""
        
    }
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city.value
        self.temperatureLabel.text = "\(vm.temperature.value.formatAsDegree())"
    }
}
