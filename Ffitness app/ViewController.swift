//
//  ViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-07.
//

import UIKit

class ViewController: UIViewController {

    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemMint
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add centered title
        let titleLabel = UILabel()
        titleLabel.text = "Welcome to Fitness App"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        view.addSubview(titleLabel)
        
        // Position the title label slightly lower
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50) // Adjust the constant value as needed
        ])
    }
    
    func setupButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemBlue
        nextButton.configuration?.title = "Get Started"
        
        nextButton.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50), // Adjust the constant value as needed
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func gotoNextScreen() {
        let nextScreen = OnboardingscreenViewController()
        //nextScreen.title = "Sign Up"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}
