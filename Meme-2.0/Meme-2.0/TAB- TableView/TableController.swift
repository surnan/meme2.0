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

    //MARK:- TableView Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempMemeObject = memes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseID) as! MemeTableViewCell
        cell.meme = tempMemeObject
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
    }
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return memes.count == 0 ? 200: 0
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let moreLabel: UILabel = {
           let label = UILabel()
            label.text = "Please click the Add icon to create a Meme"
            return label
        }()
        return moreLabel
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newController = MemeCreationController()
        newController.currentMeme = memes[indexPath.item]
        newController.currentIndex = indexPath.item
        present(newController, animated: true)
    }
    
    
    
    //MARK:- ViewController Functions
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MemeTableViewCell.self, forCellReuseIdentifier: resuseID)
        view.backgroundColor = UIColor.green
        tabBarController?.title = "Sent Memes"
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handlePlusBarButton))
    }
    
    
    @objc func handlePlusBarButton(){
        present(MemeCreationController(), animated: true)
    }
}
