//
//  YourTabBarController.swift
//  Meme-2.0
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CustomTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstController = TableController()
        firstController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondController = ContainerController()
        secondController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        
        
        let tabBarList = [firstController, secondController]
        viewControllers = tabBarList
    }
}
