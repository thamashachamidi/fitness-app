//
//  ProgressViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//

import UIKit

class ProgressViewController: UIViewController {
    
    // Progress variables
    var totalTasks: Int = 0 {
        didSet {
            updateProgress()
        }
    }
    var completedTasks: Int = 0 {
        didSet {
            updateProgress()
        }
    }
    
    // UI components
    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = .systemBlue
        progressView.trackTintColor = .systemGray
        return progressView
    }()
    
    let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update Progress", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(updateProgressButtonTapped), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Progress"
        
        // Add UI components
        view.addSubview(progressLabel)
        view.addSubview(progressBar)
        view.addSubview(updateButton)
        
        //  constraints
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressBar.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 16),
            
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 16)
        ])
        
        updateProgress()
    }
    
    // Function to update progress
    func updateProgress() {
        let progressPercentage = Float(completedTasks) / Float(totalTasks)
        progressBar.setProgress(progressPercentage, animated: true)
        
        let progressText = "\(completedTasks) / \(totalTasks) tasks completed"
        progressLabel.text = progressText
    }
    
    // Action for update progress button tapped
    @objc func updateProgressButtonTapped() {
        
        completedTasks += 1
    }
}



