//
//  firstVC.swift
//  Meme-2.0
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TableController: UITableViewController {
    
    let resuseID = "abcdefg"
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK:- ViewController Functions
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MemeTableViewCell.self, forCellReuseIdentifier: resuseID)
        view.backgroundColor = UIColor.white
        tabBarController?.title = "Sent Memes"
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handlePlusBarButton))
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete All", style: .done, target: self, action: #selector(handleDeleteAllBarButton))
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    
    @objc func handleDeleteAllBarButton(){
        self.appDelegate.memes.removeAll()
        self.tableView.reloadData()
    }
    
    
    @objc func handlePlusBarButton(){
        present(MemeCreationController(), animated: true)
    }
}
