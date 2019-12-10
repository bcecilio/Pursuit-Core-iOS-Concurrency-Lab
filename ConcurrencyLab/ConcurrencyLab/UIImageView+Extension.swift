////
////  UIImageView+Extension.swift
////  ConcurrencyLab
////
////  Created by Brendon Cecilio on 12/9/19.
////  Copyright © 2019 Brendon Cecilio. All rights reserved.
////
//
//import UIKit
//
//extension UIImageView {
//    
//    // instance method
//    func setImage(with urlString: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
//        
//        NetworkHelper.shared.performDataTask(with: urlString) { (result) in
//            switch result {
//            case .failure(let appError):
//                completion(.failure(.networkClientError(appError)))
//            case .success(let data):
//                if let image = UIImage(data: data) {
//                    completion(.success(image))
//                }
//            }
//        }
//    }
//}
