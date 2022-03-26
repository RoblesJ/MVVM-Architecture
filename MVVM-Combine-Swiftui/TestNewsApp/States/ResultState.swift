//
//  ResultState.swift
//  TestNewsApp
//
//  Created by Julio Ismael Robles on 13/08/2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
    
}
