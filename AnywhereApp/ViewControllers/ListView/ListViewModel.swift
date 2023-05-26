//
//  ListViewModel.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import Foundation

class ListViewModel {
    func fetchCharacterInformation(completion:@escaping ([Character]?) -> ()) {
        CharacterService().fetchCharacterInformation { result in
            switch result {
            case .success( let characters):
                completion(characters)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
