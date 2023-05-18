//
//  WorkoutViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        
      
    }
    private func setupView(){
        setupNavigation()
        setupContinerView()
    }

    private func setupNavigation() {
        navigationItem.title = "workout"
    }
    
    private func setupContinerView(){
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
