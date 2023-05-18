//
//  ViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-07.
//

import UIKit

class ViewController: UIViewController {

    let nextButton = UIButton()
    let logoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add centered title
        let titleLabel = UILabel()
        titleLabel.text = "FitVibe"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        view.addSubview(titleLabel)
        
        // Position the title label slightly lower
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50) // Adjust the constant value as needed
        ])
        
        // Add logo image view
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -50), // Adjust the constant value as needed
            logoImageView.widthAnchor.constraint(equalToConstant: 200), // Adjust the width as needed
            logoImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust the height as needed
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


