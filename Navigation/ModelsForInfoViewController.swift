//
//  ModelsForInfoViewController.swift
//  Navigation
//
//  Created by ln on 28.03.2023.
//

import Foundation

public class Planet: Codable {
    
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
}

public class Resident: Codable {
    
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
    var created: String
    var edited: String
    var url: String
}
