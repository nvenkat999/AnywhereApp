//
//  Configuration.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/25/23.
//

import Foundation
import UIKit

public enum Configuration {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found in project")
        }
        return dict
    }()

    static let appName: String = {
        guard let baseURL = Configuration.infoDictionary[ConfigKeys.appName.rawValue] as? String else {
            fatalError("Base URL not found")
        }
        return baseURL
    }()

    static let baseUrlString: String = {
        guard let baseURL = Configuration.infoDictionary[ConfigKeys.baseURL.rawValue] as? String else {
            fatalError("Base URL not found")
        }
        return baseURL
    }()

    static let apiPath: String = {
        guard let apiPathString = Configuration.infoDictionary[ConfigKeys.apiPath.rawValue] as? String else {
            fatalError("Base URL not found")
        }
        return apiPathString
    }()

    private enum ConfigKeys: String {
        case baseURL = "BASE_URL"
        case apiPath = "CHARACTER_API_PATH"
        case appName = "BUNDLE_DISPLAY_NAME"
    }
}
