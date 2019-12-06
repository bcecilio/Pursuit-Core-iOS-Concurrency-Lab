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
