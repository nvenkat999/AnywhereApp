//
//  ListViewController.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UISplitViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var activityIndicator = UIActivityIndicatorView(style: .large)

    var characters: [Character]?
    var filteredCharacters: [Character]?

    override func viewDidLoad() {
        registerCells()
        createActivityIndicator()
        activityIndicator.startAnimating()
        ListViewModel().fetchCharacterInformation {[weak self] characterList in
            self?.characters = characterList
            self?.filteredCharacters = characterList
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }

    func registerCells() {
        tableView.register(UINib(nibName: "CharacterListCell", bundle: nil), forCellReuseIdentifier: "characterListCell")
    }

    func createActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCharacters?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterListCell", for: indexPath) as! CharacterListCell
        cell.configure(title: filteredCharacters![indexPath.row].title ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let characterDetails = filteredCharacters?[indexPath.row] else { return}
        if let vc = splitViewController?.secondaryViewController as? DetailViewController {
            vc.delegate.didSelectListItem(character: characterDetails)
        } else if splitViewController?.isCollapsed ?? false {
            let homeStoryboard: UIStoryboard = UIStoryboard(name: "HomeScreen", bundle: nil)
            let detailViewController = homeStoryboard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
            detailViewController.characterDetails = characterDetails
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let characters = characters else {return}

        filteredCharacters = searchText.isEmpty ? characters : characters.filter { $0.description.contains(searchText) }
        self.tableView.reloadData()
    }
}
