//
//  WebServices.swift
//  GoodWeatherApp
//
//  Created by Julio Ismael Robles on 02/11/2021.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
    
}

final class WebService{
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> () ) {
        print(resource.url)
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                print(data)
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
        
    }
}
