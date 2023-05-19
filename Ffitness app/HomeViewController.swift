//
//  HomeViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        setupCardView()
    }
    
    private func setupCardView() {
        view.addSubview(cardView)
        
        // Add constraints for the card view
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            cardView.widthAnchor.constraint(equalToConstant: 300),
            cardView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func cardTapped() {
        // Handle card tapped action
        let customscheduleViewController = CustomScheduleViewController()
        navigationController?.pushViewController(customscheduleViewController, animated: true)
    }
}


