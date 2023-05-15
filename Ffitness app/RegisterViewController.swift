//
//  RegisterViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-14.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let usernameField = UITextField()
    let emailField = UITextField()
    let passwordField = UITextField()
    let registerButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemBackground
        
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        usernameField.autocapitalizationType = .none
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameField)
        
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
     
        let stackView = UIStackView(arrangedSubviews: [usernameField, emailField, passwordField, registerButton])
              stackView.axis = .vertical
              stackView.spacing = 20
              stackView.translatesAutoresizingMaskIntoConstraints = false
              view.addSubview(stackView)

        
        NSLayoutConstraint.activate([
                    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                    registerButton.heightAnchor.constraint(equalToConstant: 50)
                ])
            }

    @objc func gotoNextScreen(){
           let nextscreen = WorkoutListViewController()
        
           navigationController?.pushViewController(nextscreen, animated: true)
       }
   }
        
     
    
    

   

