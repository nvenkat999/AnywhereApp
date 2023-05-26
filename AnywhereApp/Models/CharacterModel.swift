//
//  CharacterModel.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import Foundation

public struct CharacterResponse: Codable {
    let RelatedTopics: [Character]
}

public struct Character: Codable {
    let firstURL: String?
    let icon: CharacterIcon?
    let result: String?
    let description: String
    var imageUrl: String? {
        get{
            if let icon = icon?.url {
                return "https://duckduckgo.com" + icon
            }
            return nil
        }
    }
    var title:String? {
        get{
            let textString = description.components(separatedBy: " - ")
            return textString[0]
        }
    }

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case description = "Text"
    }
}

struct CharacterIcon: Codable {
    let url: String?

    enum CodingKeys: String, CodingKey {
        case url = "URL"
    }
}
