//
//  ViewController.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/6/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var country = [CountryData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchQuery = ""{
        didSet {
            searchBarQuery()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let DetailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        DetailViewController.countryDetail = country[indexPath.row]
    }
    
    func loadData(){
        country = CountryData.getCountry()
    }
    
    func searchBarQuery() {
        country = CountryData.getCountry().filter
            {$0.name.lowercased().contains(searchQuery.lowercased())}
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("did not dequeue")
        }
        let countries = country[indexPath.row]
        cell.configureCell(country: countries)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            searchBarQuery()
            loadData()
            return
        }
        searchQuery = searchText
    }
}

