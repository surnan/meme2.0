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
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.lightBlue: UIColor.myLightGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return memes.count == 0 ? 200: 0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let moreLabel: UILabel = {
            let label = UILabel()
            let memeTextAttributesCopper:[NSAttributedString.Key: Any] = [
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.foregroundColor: UIColor.orange,
                NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 30)!,
                NSAttributedString.Key.strokeWidth: -4.6
            ]
            
            let memeTextAttributesVerdana:[NSAttributedString.Key: Any] = [
                NSAttributedString.Key.strokeColor: UIColor.gray,
                NSAttributedString.Key.foregroundColor: UIColor.blue,
                NSAttributedString.Key.font: UIFont(name: "Verdana", size: 35)!,
                NSAttributedString.Key.strokeWidth: -5.0
            ]
            
            let string1 = NSMutableAttributedString(string: "PRESS  ", attributes: memeTextAttributesCopper)
            let string2 = NSMutableAttributedString(string: "+", attributes: memeTextAttributesVerdana)
            let string3 = NSMutableAttributedString(string: "\nTO CREATE MEME", attributes: memeTextAttributesCopper)
            
            let combination = NSMutableAttributedString()
            [string1, string2, string3].forEach{combination.append($0)}
            label.attributedText = combination
            
            label.textAlignment = .center
            label.numberOfLines = -1
            return label
        }()
        return moreLabel
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newController = MemeCreationController()
        newController.currentMeme = memes[indexPath.item]
        newController.currentIndex = indexPath.item
        navigationController?.pushViewController(newController, animated: true)
    }


    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  nil, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.appDelegate.memes.remove(at: indexPath.item)
            self.tableView.reloadData()
            success(true)
        })
        deleteAction.image = #imageLiteral(resourceName: "delete")
        deleteAction.backgroundColor = UIColor.red
        
        let editAction = UIContextualAction(style: .destructive, title:  "EDIT", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
 
            let newVC = MemeCreationController()
            newVC.currentMeme = self.memes[indexPath.item]
            self.navigationController?.pushViewController(newVC, animated: true)
            
            success(true)
        })
        editAction.backgroundColor = UIColor.blue
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
