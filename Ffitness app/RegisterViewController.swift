//
//  RegisterViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-14.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemMint
        
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailField)
        
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordField)
     
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
     
        let stackView = UIStackView(arrangedSubviews: [emailField, passwordField, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            emailField.heightAnchor.constraint(equalToConstant: 40),
            passwordField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func gotoNextScreen() {
        guard let email = emailField.text, let password = passwordField.text else {
            // Handle empty fields or other validation errors
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle authentication error
                print("Error creating user:", error)
            } else {
                // User successfully registered
                print("User registered successfully")
                
                // Proceed to the next screen (TabBarViewController)
                let nextScreen = TabBarViewController()
                self.navigationController?.pushViewController(nextScreen, animated: true)
            }
        }
    }
}
