//
//  TabBarViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let vc1 = HomeViewController()
        let vc2 = WorkoutViewController()
        let vc3 = ProgressViewController()
        let vc4 = ProgrammesViewController()
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        vc4.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        
        vc1.title = "Home"
        vc2.title = "Workout"
        vc3.title = "Progress"
        vc4.title = "Programmes"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        vc4.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
    }
}

