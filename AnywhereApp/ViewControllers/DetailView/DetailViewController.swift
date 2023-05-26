//
//  DetailViewController.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import UIKit

protocol DetailViewControllerDelegate {
    func didSelectListItem(character: Character)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var characterTitle: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterDescription: UITextView!

    var delegate: DetailViewControllerDelegate!
    var characterDetails: Character?

    override func viewDidLoad() {
        characterTitle.text = characterDetails?.title
        characterDescription.text = characterDetails?.description
        characterImage.image = UIImage(url: URL(string: characterDetails?.imageUrl ?? "")) ?? UIImage(named: "placeholder_image")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = !(splitViewController?.isCollapsed ?? false)
    }
}
