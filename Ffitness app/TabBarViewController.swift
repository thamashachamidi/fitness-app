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
        

    
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: WorkoutViewController())
        let vc3 = UINavigationController(rootViewController: CustomScheduleViewController())
        let vc4 = UINavigationController(rootViewController: ProgressViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        
        
        //vc1.tabBarItem.image = UIImage(systemName: "house")
        //vc2.tabBarItem.image = UIImage(systemName: "workout")
        //vc3 .tabBarItem.image  = UIImage(systemName: "maginfyingglass")
        //vc4.tabBarItem.image = UIImage(systemName: "more")
        
        vc1.title = "House"
        vc2.title = "workout"
        vc3.title = "Schedule"
        vc4.title = "Progress"
        vc5.title = "Profile"
        
        setViewControllers([vc1, vc2, vc3,vc4,vc5], animated: true)
    
   
    }
}

