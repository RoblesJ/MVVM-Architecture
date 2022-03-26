//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by Julio Ismael Robles on 27/10/2021.
//

import Foundation

struct Stock: Decodable {
    
    let symbol: String
    let description: String
    let price: Double
    let change: String
    
}
