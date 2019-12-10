//
//  DetailViewController.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/6/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var countryDetail: CountryData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let countryInfo = countryDetail else {
            fatalError("this is the error \(Error.self)")
        }
        countryLabel.text = countryInfo.capital
        populationLabel.text = countryInfo.population.description
        
        ImageClient.fetchImage(for: countryInfo.flag) { [weak self](result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async{
                    self?.imageView.image = image
                }
            }
        }
    }
}
