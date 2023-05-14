//
//  SecondOnboardingscreenViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-12.
//

import UIKit

class SecondOnboardingscreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

       
        let titleLabel = UILabel()
        titleLabel.text = "Work out anywhere"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center

        let descriptionLabel = UILabel()
        descriptionLabel.text = "You can do your workout at home without any equiment, outside or at gym"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        
        
        let bottomConstraint = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        let leadingConstraint = button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        let trailingConstraint = button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 44)

        NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])


        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    
    }
    

    
    @objc func gotoNextScreen(){
        let nextscreen = LoginViewController()
        //nextscreen.title = "Back "
        navigationController?.pushViewController(nextscreen, animated: true)
    }
    


}
