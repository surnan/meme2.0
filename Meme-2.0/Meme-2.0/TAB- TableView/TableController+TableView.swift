//
//  TableController+TableView.swift
//  Meme-2.0
//
//  Created by admin on 12/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension TableController {
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
    
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .normal, title: "Share", handler: shareActionHandler)
        let deleteAction = UITableViewRowAction(style: .destructive , title: "Delete", handler: deleteActionHandler)
        shareAction.backgroundColor = UIColor.blue
        return [deleteAction, shareAction]
    }

    
    private func deleteActionHandler(action:UITableViewRowAction, indexPath: IndexPath){
        print("Shared")
     }
    
    private func shareActionHandler(action:UITableViewRowAction, indexPath: IndexPath){
        print("EDITED")
    }
    
    
}
