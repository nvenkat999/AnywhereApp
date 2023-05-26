//
//  HomeSplitViewController.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import UIKit

class HomeSplitViewController: UISplitViewController, UISplitViewControllerDelegate, DetailViewControllerDelegate {

    var listViewController: ListViewController!
    var detailViewController: DetailViewController!

    override func awakeFromNib() {
        self.delegate = self
        self.preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        listViewController = self.viewControllers[0] as? ListViewController
        detailViewController = (self.viewControllers[1] as! UINavigationController).topViewController as? DetailViewController
        detailViewController.delegate = self
    }

    func didSelectListItem(character: Character) {
        detailViewController.characterDetails = character
        detailViewController.viewDidLoad()
    }

    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}

extension UISplitViewController {
    var primaryViewController: UIViewController? {
        return (self.viewControllers.first as? UINavigationController)?.viewControllers.first
    }

    var secondaryViewController: UIViewController? {
        return ((self.viewControllers.last as? UINavigationController)?.viewControllers.count ?? 0 > 0) ? (self.viewControllers.last as? UINavigationController)?.viewControllers.last : nil
    }
}
