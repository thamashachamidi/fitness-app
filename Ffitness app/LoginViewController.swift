//
//  LoginViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-14.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    let infoLabel = UILabel()
    let signupButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Welcome Back"
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
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        
        infoLabel.text = "Don't have an account?"
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        
        signupButton.setTitle("Register now", for: .normal)
        signupButton.setTitleColor(.systemBlue, for: .normal)
        signupButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signupButton)
        
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            infoLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            signupButton.leadingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 10),
            signupButton.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
        ])
    }
    
    
    @objc func gotoNextScreen() {
        guard let email = emailField.text, let password = passwordField.text else {
            // Handle empty fields or other validation errors
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle login error
                print("Error logging in:", error)
                
                // Display an error message to the user
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                // User logged
                print("User logged in successfully")
                
                
                
                
                let nextScreen = TabBarViewController()
                self.navigationController?.pushViewController(nextScreen, animated: true)
            }
        }
    }
    
    @objc func signUpTapped() {
        let nextScreen = RegisterViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
    

    


