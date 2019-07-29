//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/22/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit
class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        return navController
        
    }
}
