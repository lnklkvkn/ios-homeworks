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
        case .one (let url):
            myUrl = url
        case .two (let url):
            myUrl = url
        case .three(let url):
            myUrl = url
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


enum AppConfiguration {
    
    case one(url: URL)
    case two(url: URL)
    case three(url: URL)
}

let a = AppConfiguration.one(url: URL(string: "https://swapi.dev/api/people/8")!)
let b = AppConfiguration.two(url: URL(string:"https://swapi.dev/api/starships/3")!)
let c = AppConfiguration.three(url: URL(string:"https://swapi.dev/api/planets/5")!)

