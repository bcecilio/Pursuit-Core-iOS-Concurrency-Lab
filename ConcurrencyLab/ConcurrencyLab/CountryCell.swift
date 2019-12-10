//
//  CountryCell.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/9/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    func configureCell(country: CountryData) {
        countryLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = country.population.description
        
        ImageClient.fetchImage(for: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.cellImageView.image = image
                }
            case .failure(let appError):
                print("hahaha \(appError)")
            }
        }
    }
}
