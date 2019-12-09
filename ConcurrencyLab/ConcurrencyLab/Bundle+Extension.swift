//
//  Bundle+Extension.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/9/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

extension Bundle {
    
    static func parseData(filename: String, ext: String) -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("resource with filename not found")
        }
        
        var data: Data!
        
        do{
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("\(error)")
        }
        return data
    }
}
