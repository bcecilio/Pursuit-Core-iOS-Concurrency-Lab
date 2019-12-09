//
//  CountryData.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/6/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct CountryData: Decodable {
    let name: String
    let population: Double
    let capital: String
    let currencies: [Currency]
}

struct Currency: Decodable {
    let code: String
    let name: String
    let symbol: String
}

extension CountryData {
    static func getCountry(from: Data) -> [CountryData] {
        
        var countries = [CountryData]()
        guard let fileURL = Bundle.main.url(forResource: "Country", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let countryData = try JSONDecoder().decode([CountryData].self, from: data)
            countries = countryData
        } catch {
            fatalError("failed to load contents \(error)!!")
        }
        
        return countries
        
        }
    }
