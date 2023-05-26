//
//  NetworkManager.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/25/23.
//

import UIKit

class NetworkManager {
    func getData(url: URLRequest, withCompletion completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            DispatchQueue.main.async { completion(data, response, error) }
        }
        task.resume()
    }
}
