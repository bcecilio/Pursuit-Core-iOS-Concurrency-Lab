//
//  ExchangeRateData.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/6/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct ExchangeData: Decodable {
    let date: String
    let rates: [Rates]
}

struct Rates: Decodable {
    let TZS: Double
    let USD: Double
    let AED: Double
    let GBP: Double
    let MXN: Double 
}
