//
//  firstVC.swift
//  Meme-2.0
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TableController: UITableViewController {
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let currentMemeArray = myAppDelegate.memes
        print("Number of Elements in myAppDelegate.memes = \(currentMemeArray.count) \n\n")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        tabBarController?.title = "Sent Memes"
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleThis))
        
       
    }
    
    
    @objc func handleThis(){
        print("Hello")
        present(MemeController(), animated: true)
    }
}
