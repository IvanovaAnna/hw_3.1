//
//  WelcomeViewController.swift
//  hw_3.1
//
//  Created by Anna Ivanova on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
    }

    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
    
}
