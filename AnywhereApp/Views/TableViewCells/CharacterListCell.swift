//
//  CharacterListCell.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import UIKit

class CharacterListCell: UITableViewCell {
    @IBOutlet weak var characterNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String) {
        characterNameLabel.text = title
    }
}

