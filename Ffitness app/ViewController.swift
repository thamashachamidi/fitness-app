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
        view.backgroundColor = .systemBackground
        title = "Fitness "
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
    }
    
    func setupButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPurple
        nextButton.configuration?.title = "Get Started"
        
        nextButton.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        )
        
    }
    @objc func gotoNextScreen(){
        let nextscreen = OnboardingscreenViewController()
        //nextscreen.title = "Sign Up "
        navigationController?.pushViewController(nextscreen, animated: true)
        
        
    }
}

