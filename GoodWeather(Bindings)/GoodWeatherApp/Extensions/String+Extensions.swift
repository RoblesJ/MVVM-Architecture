//
//  String+Extensions.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
