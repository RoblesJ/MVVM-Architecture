//
//  Double+Extensions.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
