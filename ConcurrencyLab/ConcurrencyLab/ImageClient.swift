//
//  ImageClient.swift
//  ConcurrencyLab
//
//  Created by Brendon Cecilio on 12/9/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

struct ImageClient {
    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()){
        guard let url = URL(string: urlString) else {
            print("bad url \(urlString)")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print("")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
