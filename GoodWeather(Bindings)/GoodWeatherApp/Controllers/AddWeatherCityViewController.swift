//
//  AddWeatherCityViewController.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet
    weak var cityNameTextField: BindingTextField! {
        didSet {
            cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }
    @IBOutlet
    weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }
    @IBOutlet
    weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }

    private var addWeatherVM = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveCityButtonPressed() {
        // since we dont really want to do anything with the binding... just print out the output
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
