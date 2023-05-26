//
//  LoginViewController.swift
//  AnywhereApp
//
//  Created by Venkata N Naraharisetty on 5/24/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome to \(Configuration.appName) mobile app"
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let homeStoryboard: UIStoryboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        let viewController = homeStoryboard.instantiateViewController(withIdentifier: "homeSplitViewController") as! HomeSplitViewController
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = viewController
    }
}

