//
//  HomeViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint

        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Explore more workout"
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .black

        view.addSubview(descriptionLabel)

        // Set up constraints
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        // Create a tab bar
        let tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        

        // Set the tab bar item for the view controller
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        self.tabBarItem = tabBarItem
    }
}

