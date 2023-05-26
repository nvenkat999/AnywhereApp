//
//  UIImage+Extension.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/25/23.
//

import UIKit

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }

        do {
            self.init(data: try Data(contentsOf: url))
        } catch {
            print("Cannot load image from url: \(url) so adding default image")
            return nil
        }
    }
}
