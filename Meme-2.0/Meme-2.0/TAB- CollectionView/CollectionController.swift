//
//  secondVC.swift
//  Meme-2.0
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let reuseID = "zzzzzz"
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        tabBarController?.title = "Sent Memes"
        collectionView.register(MemeCollectionViewCell.self, forCellWithReuseIdentifier: reuseID)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }


}
