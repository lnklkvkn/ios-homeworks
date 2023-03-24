//
//  NetworkService.swift
//  Navigation
//
//  Created by ln on 24.03.2023.
//
import UIKit


struct NetworkService {
    
    static func request(for configuration: AppConfiguration) {
        
        let myUrl: URL
        
        switch configuration {
        case .people :
            myUrl = AppConfiguration.people.url!
        case .starships:
            myUrl = AppConfiguration.starships.url!
        case .planets:
            myUrl = AppConfiguration.planets.url!
        }
        
        let request = URLRequest(url: myUrl)
        
        let dataTask = URLSession.shared.dataTask(with: request) {data, response, error in
            
            if let data {
                let string = String(data: data, encoding: .utf8)
                print(string!)
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.allHeaderFields)
                print(response.statusCode)
            }

            if let error {
                print(error.localizedDescription)
                print((error as NSError).debugDescription)
                
//                Code=-1009 "The Internet connection appears to be offline."
            }
        }
        dataTask.resume()
    }
}


enum AppConfiguration: String {
    
    case people = "https://swapi.dev/api/people/8"
    case starships = "https://swapi.dev/api/starships/3"
    case planets = "https://swapi.dev/api/planets/5"
    
    var url: URL? {
        URL(string: self.rawValue)
    }
}


