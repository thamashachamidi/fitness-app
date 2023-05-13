//
//  LoginViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-14.
//

import UIKit

class LoginViewController: UIViewController {
    
    let usernameField = UITextField()
       let passwordField = UITextField()
       let loginButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hey there , Welcome Back ..."
        view.backgroundColor = .systemBackground
        
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        usernameField.autocapitalizationType = .none
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameField)
        
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
        
        NSLayoutConstraint.activate([
                  usernameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                  usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                  usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                  usernameField.heightAnchor.constraint(equalToConstant: 40),
                  
                  passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
                    passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    passwordField.heightAnchor.constraint(equalToConstant: 40),

                    loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
                    loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    loginButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }

    @objc func gotoNextScreen(){
        let nextscreen = RegisterViewController()
        nextscreen.title = "Back "
        navigationController?.pushViewController(nextscreen, animated: true)
    }
    


        
        

        
    
    

    

}
