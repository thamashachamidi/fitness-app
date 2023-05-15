//
//  WorkoutListViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-15.
//

import UIKit

class WorkoutListViewController: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureTableView()
        
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        
        tableView.pin(to: view)
    }
    
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension WorkoutListViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

