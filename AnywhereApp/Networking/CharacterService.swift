//
//  CharacterService.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import UIKit

protocol CharacterServiceProtocol {
    func fetchCharacterInformation(completion: @escaping (Result<[Character]?, Error>)-> Void)
}

final class CharacterService: CharacterServiceProtocol {

    func fetchCharacterInformation(completion: @escaping (Result<[Character]?, Error>) -> Void) {
        let urlString: String = "https://" + Configuration.baseUrlString + Configuration.apiPath
        let urlRequest =  URLRequest(url: URL(string: urlString)!)
        NetworkManager().getData(url: urlRequest) {
            (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let characterResponse: CharacterResponse = try decoder.decode(CharacterResponse.self, from: data)
                completion(.success(characterResponse.RelatedTopics))
            } catch let err {
                completion(.failure(err))
            }
        }
    }
}
