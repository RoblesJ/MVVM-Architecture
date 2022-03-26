//
//  WeatherListTableViewController.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnistSelection: Unit!
    private var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnistSelection = Unit(rawValue: value)!
        }
        self.dataSource = TableViewDataSource(cellIdentifier: "WeatherCell",
                                              items: self.weatherListViewModel.weatherViewModels) { cell, vm in
            cell.cityNameLabel.text = vm.city.value
            cell.temperatureLabel.text = vm.temperature.value.formatAsDegree()
            
        }
        self.tableView.dataSource = dataSource
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        if let dataSource = self.dataSource {
            dataSource.updateItems(self.weatherListViewModel.weatherViewModels)
        }
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        } else if segue.identifier == "WeatherDetailsViewController" {
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
       
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
              let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        settingsTVC.delegate = self
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
        if lastUnistSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnistSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
    
}
