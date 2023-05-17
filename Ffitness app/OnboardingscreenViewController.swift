//
//  OnboardingscreenViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-10.
//

import UIKit

class OnboardingscreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint

        let imageView = UIImageView(image: UIImage(named: "Image")) // Replace "your_image_name" with the actual name of your image asset
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        let titleLabel = UILabel()
        titleLabel.text = "Track Your Goal"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center

        let descriptionLabel = UILabel()
        descriptionLabel.text = "Get fit and healthy with our app. Track your workouts, set goals, and see your progress over time."
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

        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, descriptionLabel])
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

    @objc func gotoNextScreen() {
        let nextscreen = SecondOnboardingscreenViewController()
        navigationController?.pushViewController(nextscreen, animated: true)
    }
}
