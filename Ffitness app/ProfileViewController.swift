//
//  ProfileViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-19.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Sign out",
            style: .done,
            target: self , 
            action: #selector(didTapSignOut)
        )
    }
    

    @objc private func didTapSignOut() {
        
    }
        

}
