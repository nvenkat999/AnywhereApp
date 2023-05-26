//
//  UIButton+Extension.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/25/23.
//

import UIKit

extension UIButton {

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
